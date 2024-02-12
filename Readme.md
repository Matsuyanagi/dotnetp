# dotnetp

Create a C# project, solution, and test project using the `dotnet` command.

## Usage

`dotnetp PROJECT_NAME`

or

`dotnetp`
You will be asked for the project name.


## Project file structure

The directory structure is as follows.
```
│  SampleToolSln.sln
│  Taskfile.yml
│
├─SampleTool
│      Program.cs
│      SampleTool.csproj
│
└─SampleTool.Tests
        GlobalUsings.cs
        SampleTool.Tests.csproj
        UnitTest1.cs
```
