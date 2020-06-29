require "json"

class Request
  JSON.mapping(
    id: String?,
    command: String,
    arguments: Array(String)?,
    environment: Hash(String, String)?,
    shell: { type: Bool, default: false },
    input: String?,
    directory: String?
  )
end

def main
  loop do
    # Read the request on stdin
    request = read
    stdin = IO::Memory.new
    stdout = IO::Memory.new
    stderr = IO::Memory.new
    if request.input
      stdin << request.input
      stdin.rewind
    end
    spawn do
      status = Process.run(
        command: request.command,
        args: request.arguments,
        env: request.environment,
        shell: request.shell,
        input: stdin,
        output: stdout,
        error: stderr,
        chdir: request.directory
      )
      response = {
        id: request.id,
        status: status.exit_code,
        output: stdout.to_s,
        error: stderr.to_s
      }
      # Send the response on stdout
      send(response)
    end
  end
end

# Step 1: Read the message length (first 4 bytes)
# Step 2: Read the text (JSON object) of the message
def read
  bytes = STDIN.read_bytes(Int32)
  string = STDIN.read_string(bytes)
  request = Request.from_json(string)
end

# Step 1: Write the message size
# Step 2: Write the message itself
def send(response)
  string = response.to_json
  STDOUT.write_bytes(string.bytesize)
  STDOUT << string
  STDOUT.flush
end

main
