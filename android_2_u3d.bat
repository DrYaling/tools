@echo off
for /f "tokens=1-5" %%i in ('netstat -ano') do (
	if "%%i"=="TCP" (
		if "%%l"=="LISTENING" (
			for /f "delims=: tokens=1-2" %%o in ("%%j") do (
				if "%%p"=="5037" (
					taskkill /f /pid %%m
				)
			)
		)
	)
)

adb forward tcp:54999 localabstract:Unity-com.tencent.freestyle
adb start-server

