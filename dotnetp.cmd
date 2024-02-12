@echo off
@rem Create dotnet project

set project_name=

:label_top

if "%~1"=="" (
  set /P project_name="ProjectName ? : "
) else (
  set project_name=%~1
)

if "%project_name%"=="" (
  goto :label_top
) else (
  echo ProjectName : %project_name%
)

set test_project_name=%project_name%.Tests
set solution_name=%project_name%Sln

mkdir %project_name%
pushd %project_name%

dotnet new sln     --name %solution_name%
dotnet new console --name %project_name% --use-program-main --aot
dotnet new nunit   --name %test_project_name%
dotnet sln %solution_name%.sln add %project_name%
dotnet sln %solution_name%.sln add %test_project_name%

pushd %project_name%.Tests
dotnet add reference ../%project_name%/%project_name%.csproj
popd
::	"dotnet-test-explorer.testProjectPath": "**/*Tests.csproj" ��ݒ�

call initg.cmd

(
echo version: '3'
echo.
echo vars:
echo   PROJECT_NAME: %project_name%
echo.
echo tasks:
echo   run:
echo     dir: ./{{.PROJECT_NAME}}
echo     cmds:
echo       - dotnet run
echo     silent: true
echo.
echo   build:
echo     dir: ./{{.PROJECT_NAME}}
echo     cmds:
echo       - dotnet build
echo     silent: true
echo.
echo   publish:
echo     dir: ./{{.PROJECT_NAME}}
echo     cmds:
echo       - dotnet publish -r win-x64 -c Release
echo     silent: true
echo.
echo   test:
echo     cmds:
echo       - dotnet test
echo     silent: true
echo.
) > Taskfile.yml


popd
