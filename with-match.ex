result = with {:ok, file} = File.open("/etc/passwd"),
              content = IO.read(file, :all), # note: same name as above
              :ok = File.close(file),
              [_, uid, gid] <- Regex.run(~r/^xxx:.*?:(\d+):(\d+)/, content)
         do
              "Group: #{gid}, User: #{uid}"
         end

IO.puts inspect(result) #=> nil
