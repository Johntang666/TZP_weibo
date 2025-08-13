@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem 若中文显示异常，可改为: chcp 936 >nul（简体中文系统）
chcp 65001 >nul

rem 获取年份（locale 无关）
for /f %%y in ('powershell -NoProfile -Command "(Get-Date).Year"') do set "YEAR=%%y"

set "BASE=%cd%\%YEAR%"

if not exist "%BASE%" (
    mkdir "%BASE%"
    echo [+] 已创建: %BASE%
) else (
    echo [=] 已存在: %BASE%
)

rem 01~12
for /l %%i in (1,1,12) do (
    set "mm=0%%i"
    set "mm=!mm:~-2!"
    if not exist "%BASE%\!mm!" (
        mkdir "%BASE%\!mm!"
        echo [+] 已创建: %BASE%\!mm!
    ) else (
        echo [=] 已存在: %BASE%\!mm!
    )
)

rem 项目/领域/资源/归档 —— 注意这里用的是 %%F（批处理内必须双百分号）
for %%F in (项目 领域 资源 归档) do (
    if not exist "%BASE%\%%F" (
        mkdir "%BASE%\%%F"
        echo [+] 已创建: %BASE%\%%F
    ) else (
        echo [=] 已存在: %BASE%\%%F
    )
)

endlocal
echo 完成。
