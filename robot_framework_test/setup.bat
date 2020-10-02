if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )
pip install -r requirements.txt  
pause