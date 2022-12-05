### CLIWrap
```cs
using CliWrap.Buffered;
using CliWrap;
using CliWrap.EventStream;

var containerID = new List<string>();
var input = Cli.Wrap("git").WithArguments("--version").WithValidation(CommandResultValidation.None);
var cmd =  input | Console.WriteLine;
await cmd.ExecuteAsync();
// 
//conditional 
// 
await foreach (var cmdEvent in Cli.Wrap("git").WithArguments("-a").ListenAsync())
{
    switch(cmdEvent){
        case StartedCommandEvent started:
            Console.WriteLine(started.ProcessId);    
            break;
        case StandardOutputCommandEvent stdOut:
            Console.ForegroundColor = ConsoleColor.Blue;
            Console.WriteLine(stdOut.Text);
            Console.ResetColor();
            break;
        case StandardErrorCommandEvent stdErr:
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("ERR>");
            break;
    }

}

```
