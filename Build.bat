@cls
@Call "%VS110COMNTOOLS%vsvars32.bat"
echo "Build"

@devenv "TaskKeyHook.sln" 				/Rebuild "Release|Win32" 
@if not %errorlevel% ==0 goto exceptionEnd
@devenv "TaskKeyHook.sln" 				/Rebuild "Release|x64" 
@if not %errorlevel% ==0 goto exceptionEnd

@devenv "ScreenLocker.sln" 				/Rebuild "Release|Win32" 
@if not %errorlevel% ==0 goto exceptionEnd
@devenv "ScreenLocker.sln" 				/Rebuild "Release|x64" 
@if not %errorlevel% ==0 goto exceptionEnd

@devenv "ResEdit\ResEdit.sln" 		/Rebuild "Release|Win32" 
@if not %errorlevel% ==0 goto exceptionEnd

@devenv "ServiceUpgrade.sln" 				/Rebuild "Release|Win32" 
@if not %errorlevel% ==0 goto exceptionEnd

@devenv "SafeExt.sln" 					/Rebuild "Unicode Release MinSize|Win32" 
@if not %errorlevel% ==0 goto exceptionEnd

@devenv "ClientOp.sln" 					/Rebuild "Release|Win32" 
@if not %errorlevel% ==0 goto exceptionEnd

@devenv "SafeDiskManager.sln" 			/Rebuild "Release|Win32" 
@if not %errorlevel% ==0 goto exceptionEnd

REM @devenv "KeyMaker.sln" 					/Rebuild "Release|Win32" 
REM @if not %errorlevel% ==0 goto exceptionEnd

cd ..\Bin
del MacManager.Bin.7z
del ���ҵ�����˾ר������ϵͳ.exe
copy MacManager.exe ���ҵ�����˾ר������ϵͳ.exe
7z a MacManager.Bin.7z ���ҵ�����˾ר������ϵͳ.exe ClientOp.exe KeyMaker.exe  

@echo ========================================
@echo Build Success
pause
exit

:exceptionEnd
@echo ========================================
@echo Build Failed
pause

rem exit
