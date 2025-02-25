@echo off
cls
setlocal EnableDelayedExpansion

for /f "usebackq tokens=1,2,3 delims=;" %%a in ("DefAcronymsMeaningNouns.csv") do (
    set prehal=%%a
    set hal=!prehal:"=!
    set filename=!hal:/=_!.md
    set pretags=%%c
    set tags=!pretags:"=!
    echo !filename! and tags: !tags!
    (
        echo ---
        echo acronym: !hal!
        echo definition: %%b
        echo tags: arconym, !tags!
        echo ---
        echo.
        echo %%b
    ) > !filename!
)

