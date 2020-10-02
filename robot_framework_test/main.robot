*** Settings ***
Suite Setup     setup_driver
Library    python_methods/python_methods.py
Library    python_methods/YesOrNoQuestion.py

*** Variables ***
${Driver}    0        # Setting it to 0, but it will be reinitialised later on
${Google_Website}    https://www.google.com/

*** Test Cases ***
Open_chrome_and_website
    [Documentation]    30/09/2020    Bahjat Murrad
    ...    This test case is testing to see that we can access the website
    ${Test_Case_ID}    Set Variable    1
    Log To Console    Running Test Case ${Test_Case_ID}\n
    python_methods.visit_website    ${Driver}    ${Google_Website}
    ${Current_URL}    python_methods.Get Current Url    ${Driver}
    Should Be Equal As Strings    ${Current_URL}    ${Google_Website}    msg=Failed Test Case ${Test_Case_ID}, the system failed to navigate to ${Google_Website}      

Accept_Cookies
    [Documentation]    30/09/2020    Bahjat Murrad
    ...    Accepting the cookies
    ${Test_Case_ID}    Set Variable    2
    Sleep    5    
    Log To Console    Running Test Case ${Test_Case_ID}
    python_methods.Click Accept Google Terms    ${Driver}

Navigate_To_NAV
    [Documentation]    01/10/2020    Bahjat Murrad
    ...    Clicking on the dots
    ${Test_Case_ID}    Set Variable    3
    Log To Console    Running Test Case ${Test_Case_ID}
    python_methods.Find Specific Css Selector And Click    ${Driver}    "#gbwa > div"           # Clicking on the specified selector

Navigate_To_Maps
    [Documentation]    01/10/2020    Bahjat Murrad
    ...    Clicking on the maps icon
    ${Test_Case_ID}    Set Variable    4
    Log To Console    Running Test Case ${Test_Case_ID}
    python_methods.Switch To Frame Via Number    ${Driver}    0
    python_methods.Find Specific Css Selector And Click    ${Driver}    "#yDmH0d > c-wiz > div > div > c-wiz > div > div > ul.LVal7b.u4RcUd > li:nth-child(3) > a"

Navigate_To_Specific_Address    
    [Documentation]    01/10/2020    Bahjat Murrad
    ...    Entering the specific post code
    ${Test_Case_ID}    Set Variable    5
    Log To Console    Running Test Case ${Test_Case_ID}
    python_methods.Send Keys To Css Selector    ${Driver}    "#searchboxinput"    "UB8 3PH"            # Sending UB8 3PH, it has been defined in the test plan
    Sleep    2    # Ideally i would use explict time outs that selenium uses but due to time restraints i'm using sleep methods
    python_methods.Find Specific Css Selector And Click    ${Driver}    "#sbse0 > div.sbqs_c > div > div > div.suggest-left-cell"        # Clicking the suggested results

Click_On_SLoop_Road
    [Documentation]    01/10/2020    Bahjat Murrad
    ...    Asking the user to click on SLoop Road
    [Tags]    Manual
    ${Test_Case_ID}    Set Variable    6
    Log To Console    Running Test Case ${Test_Case_ID}
    YesOrNoQuestion    Please click on the S Loop road and press the Yes or No button when completed
    python_methods.Find Specific Css Selector And Click    ${Driver}    "#reveal-card > div > button.widget-reveal-card-directions > span"        # Clicking the direction button

Click_On_Second_Point 
    [Documentation]    01/10/2020    Bahjat Murrad
    ...    Asking the user to click on the second point
    [Tags]    Manual
    ${Test_Case_ID}    Set Variable    7
    Log To Console    Running Test Case ${Test_Case_ID}
    YesOrNoQuestion    Please click on the second point, once finished, press yes or no

Find_Distance_and_time
    [Documentation]    01/10/2020    Bahjat Murrad
    ...    Asking the user if the correct distance has been defined
    ${Test_Case_ID}    Set Variable    8
    Log To Console    Running Test Case ${Test_Case_ID}
    ${ans}    python_methods.Read Css Selector    ${Driver}    "#section-directions-trip-0 > div.section-directions-trip-description > div:nth-child(3) > div.section-directions-trip-numbers > div.section-directions-trip-duration"
    ${ans}    YesOrNoQuestion    Is the time shown on the screen ${ans}?
    Should Be Equal As Strings    ${ans}    Yes    msg=Failed Test Case ${Test_Case_ID}, the correct time was not shown    
    ${ans}    python_methods.Read Css Selector    ${Driver}    "#section-directions-trip-0 > div.section-directions-trip-description > div:nth-child(3) > div.section-directions-trip-numbers > div.section-directions-trip-distance.section-directions-trip-secondary-text"
    ${ans}    YesOrNoQuestion    Is the distance shown on the screen ${ans}?
    Should Be Equal As Strings    ${ans}    Yes    msg=Failed Test Case ${Test_Case_ID}, the correct distance was not shown    

*** Keywords ***
setup_driver
    ${Driver}    python_methods.Setup_Function
    python_methods.Maximize Window    ${Driver}
    Set Global Variable    ${Driver}    

YesOrNoQuestion
    [Arguments]    ${Statement}
    [Documentation]    07/03/2019 \ \ \ \ Bahjat Murrad \ \ \ Bahjat.murrad@bhge.com
    ...
    ...    Keyword calls the yes or no qeustion, returns the answer.
    ...
    ...    The returned answer can be Yes or No, that's it
    ${Time}    Get Time
    Import Library    ${EXECDIR}/Python_Methods/YesOrNoQuestion.py    ${Statement}    WITH NAME    ${Time}
    ${Temp_question}    Get Library Instance    ${Time}
    Call Method    ${Temp_question}    main_loop
    ${ans}    Set Variable    ${Temp_question.ans}
    [Return]    ${ans}
