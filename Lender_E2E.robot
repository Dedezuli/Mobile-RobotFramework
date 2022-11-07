*** Settings ***
Library                AppiumLibrary
Library                Process
Library                FakerLibrary
Library                String
Library                ImapLibrary
Documentation          E2E Testing


Suite Setup           Spawn Appium Server
Suite Teardown        Close Appium Server
Test Teardown         Close Application


*** Variables ***

${PLATFORM_NAME}       Android
${PLATFORM_VERSION}    8.0
${APK_ENV}             id.investree.lender.dev
${APPIUM_PORT}         4723
${BOOTSTRAP_PORT}      4724
${user_lenderkovich}   lenderkovich@yopmail.com
${pass1}               Asdf1234
${pass2}               Aaaa1111
${wrong_pass}          Afjh1923
${wrong email}         lenderkobichz@yopmail.id



*** Test Cases ***


Login_wrong_email
  Open App   
  Language selection indonesian
  On Boarding
  Input wrong email                          
  Input correct password                       
  Click Element                        id=btn_login
  Page Should Contain Text             Email atau password salah


Login_wrong_password
  Open App   
  Language selection indonesian
  On Boarding
  Input correct email 
  Input wrong password
  Click Element                        id=btn_login
  Page Should Contain Text             Email atau password salah


Login Forgot Password with wrong email
  Open App
  Language selection indonesian
  On Boarding
  Wait Until Page Contains Element     id=edt_email
  Click Element                        id=text_forgot_password
  Wait Until Page Contains Element     id=toolbar_title_big
  Element Should Contain Text          id=toolbar_title_big  Lupa Password
  Click Element                        id=et_email
  Clear Text                           id=et_email
  Input Text                           id=et_email    lenderkovich@yopmail.com
  Hide Keyboard
  Click Element                        id=btn_reset
  Wait Until Page Contains Element     id=btn_positive
  Click Element                        id=btn_positive
  # Page Should Contain Text             Akun Anda tidak terdaftar sebagai lender


Login Forgot Password
  Open App
  Language selection indonesian
  On Boarding
  Wait Until Page Contains Element     id=edt_email
  Click Element                        id=text_forgot_password
  Wait Until Page Contains Element     id=toolbar_title_big
  Element Should Contain Text          id=toolbar_title_big  Lupa Password
  Click Element                        id=et_email
  Clear Text                           id=et_email
  Input Text                           id=et_email    lenderkovich@yopmail.com
  Hide Keyboard
  Click Element                        id=btn_reset
  Wait Until Page Contains Element     id=btn_positive
  Click Element                        id=btn_positive
  Wait Until Page Contains Element     id=edt_email


Dashboard_calculator
  Open App   
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password   
  Click Element                        id=btn_login
  Wait Until Page Contains Element     id=menu_loan_listing  timeout=15
  Swipe By Percent                     50 80  50  40
  Wait Until Page Contains Element     id=card_calculator
  Click Element                        id=card_calculator
  Wait Until Page Contains Element     id=toolbar_title_big
  Element Should Contain Text          id=toolbar_title_big  Kalkulator Simulasi
  Click Element                        id=et_value
  Clear Text                           id=et_value
  Input Text                           id=et_value   10000000
  Hide Keyboard
  Click Element                        id=et_risk_grade
  # Wait Until Page Contains Element     id=toolbar_title_big
  # Element Should Contain Text          id=toolbar_title_big  Pilih Tingkat Resiko
  Click Text                           20%
  Click Element                        id=et_tenor
  # Wait Until Page Contains Element     id=toolbar_title_big
  # Element Should Contain Text          id=toolbar_title_big  Pilih Jangka Waktu
  Click Text                           90
  Click Element                        id=btn_calculate
  Page Should Not Contain Text         Rp 0


Marketplace_Funding_below_minimum  
  Open App   
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Wait Until Page Contains Element     id=menu_loan_listing  timeout=15
  Click Element                        id=menu_loan_listing
 # Wait Until Page Contains Element     id=toolbar_title_big
 # Element Should Contain Text          id=toolbar_title_big  Daftar Pinjaman
  #Wait Until Page Contains Element     id=btn_see_detail
  # Swipe By Percent                     50 80  50  10
  Wait Until Page Contains Element     id=btn_founding   timeout=20
  Element Should Be Visible            id=btn_founding
  Click Element                        id=btn_founding
  Wait Until Page Contains Element     id=et_value
  Click Element                        id=et_value
  Clear Text                           id=et_value
  Input Text                           id=et_value  100000
  Hide Keyboard
  Page Should Contain Text             Nominal pendanaan belum memenuhi batas
 

Marketplace_Funding_Normal
  Open App                            
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Wait Until Page Contains Element     id=menu_loan_listing  timeout=15
  Click Element                        id=menu_loan_listing
# Wait Until Page Contains Element    id=toolbar_title_big
# Element Should Contain Text         id=toolbar_title_big  Daftar Pinjaman
  Wait Until Page Contains Element     id=btn_see_detail   timeout=20
  # Swipe By Percent                     50 80  50  10
  Wait Until Page Contains Element     id=btn_founding
  Element Should Be Visible            id=btn_founding
  Click Element                        id=btn_founding
  Wait Until Page Contains Element     id=et_value
  Click Element                        id=et_value
  Clear Text                           id=et_value
  Input Text                           id=et_value   1000000
  Hide Keyboard
  Click Element                        id=btn_funding
  Wait Until Page Contains Element     id=text_disclamer
  Click Element                        id=btn_funding
  Wait Until Page Contains Element     id=btn_next
  Click Element                        id=btn_next
  Wait Until Page Contains Element     id=pin_container
  Click Element                        id=pin_container
  Input Text                           id=pin_container  999999
  Click A Point                        538  1633
  Click A Point                        523  966 
  Click Element                        xpath=//android.widget.TextView[@text='Lihat detail']

Marketplace_funding_Reksadana_unregistered
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Hide Keyboard
  Click Element                        id=btn_login
  Wait Until Page Contains Element     id=btn_dummy_goto_reksadana
  Click Element                        id=btn_dummy_goto_reksadana
  

Dashboard Withdraw below minimum
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=imv_withdraw
  Wait Until Page Contains Element     id=text_nominal
  Click Element                        id=edt_nominal
  Input Text                           id=edt_nominal 10000
  Hide Keyboard
  Click Element                        id=edt_reason_withdraw
  Input Text                           id=edt_reason_withdraw withdraw
  Hide Keyboard
  Click Element                        id=btn_next
  Wait Until Page Contains Element     id=text_withdraw

Dashboard Withdraw
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=imv_withdraw
  Wait Until Page Contains Element     id=text_nominal
  Click Element                        id=edt_nominal
  Clear Text                           id=edt_nominal
  Input Text                           id=edt_nominal 50000
  Hide Keyboard
  Click Element                        id=edt_reason_withdraw
  Input Text                           id=edt_reason_withdraw withdraw
  Hide Keyboard
  Click Element                        id=btn_next
  Wait Until Page Contains Element     id=text_withdraw


Portfolio_marketplace
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password 
  Click Element                        id=nav_portfolio
  Wait Until Page Contains Element     id=text_onfunding  timeout=10
  Click Element                        accessibility_id=MarketPlace

Portfolio_SBN  
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password 
  Click Element                        id=nav_portfolio
  Click Element                        accessibility_id=SBN

Portfolio_RD
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password 
  Click Element                        id=nav_portfolio
  Wait Until Page Contains Element     id=text_onfunding
  Click Element                        accessibility_id=Reksa Dana  

Profile Change Language ID>EN
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_profile
  Click Element                        id=menu_setting_language
  Elemet Should Be Visible             id=iv_indonesian_selected
  Click Element                        id=select_english
  Wait Until Page Contains Element     id=btn_positive
  Click Element                        id=btn_positive

Profile Change Language EN>ID
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_profile
  Click Element                        id=menu_setting_language
  Elemet Should Be Visible             id=iv_english_selected
  Click Element                        id=select_indonesian
  Wait Until Page Contains Element     id=btn_positive
  Click Element                        id=btn_positive

Profile Referral
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_profile
  Click Element                        id=menu_invite_friends
  Click Element                        id=tv_referral_code
  Page Should Contain Text             Kode berhasil disalin

Profile TnC
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_profile
  Click Element                        id=menu_privacy_policy
  Element Should Contain Text          id=toolbar_title   Syarat & Ketentuan
  Page Should Contain Text             Halaman ini menetapkan ketentuan


Profile Privacy Policy
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_profile
  Click Element                        id=menu_privacy_policy
  Element Should Contain Text          id=toolbar_title   Kebijakan Privasi
  Page Should Contain Text             Gambaran Singkat

Profile Risk disclaimer
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_profile
  Click Element                        id=menu_privacy_policy
  Element Should Contain Text          id=toolbar_title   Penafian Resiko
  Page Should Contain Text             Layanan Pinjam Meminjam

Profile General disclaimer
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_profile
  Click Element                        id=menu_privacy_policy
  Element Should Contain Text          id=toolbar_title   Penafian Resiko
  Page Should Contain Text             PT Investree Radhika Jaya

Help Use Find
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_help
  Element Should Contain Text          id=toolbar_title_big   Bantuan
  Click Element                        id=et_search
  Clear Text                           id=et_search
  Input Text                           id=et_search   Syariah

Help_All_FAQ
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_help
  Element Should Contain Text          id=toolbar_title_big   Bantuan
  Click Element                        id=tv_view_all_faq
  Element Should Contain Text          id=toolbar_title_big   Semua FAQ
  
Help_All_FAQ
  Open App
  Language selection indonesian
  On Boarding
  Input correct email
  Input correct password
  Click Element                        id=btn_login
  Click Element                        id=nav_help
  Swipe By Percent                     50 80  50  10
  Click Element                        id=tv_contact_cs_desc

Register_User_MIWNIKS
  Open App
  Language selection indonesian
  On Boarding
  Wait Until Page Contains Element     id=text_register
  Click Element                        id=text_register
  Wait Until Page Contains Element     id=rb_male
  Click Element                        id=rb_male
  Click Element                        id=edt_full_name
  Random first name
  Random phone number 
  Choose Nationality indonesian
  Random email
  Click Element                        id=edt_pass
  Clear Text                           id=edt_pass
  Input Password                       id=edt_pass  Asdf1234
  Hide Keyboard
  Swipe By Percent                     50 80  50  10
  Sleep  10
  Wait Until Page Contains Element     id=btn_register
  Click Element     id=btn_register
  Sleep  4



*** Keywords ***


Open App
  Open Application  http://localhost:4723/wd/hub  platformName=${PLATFORM_NAME}  deviceName=${DEVICE_NAME}  app=${CURDIR}/app-staging-x86-release.apk   automationName=UiAutomator2  appPackage=${APK_ENV}  appActivity=id.investree.ui.splashscreen.SplashScreenActivity  autoGrantPermissions=true 

Get Working Path
  Run Process         pwd  shell=True  alias=proc1
  ${WORKING_PATH}=    Get Process Result  proc1  stdout=true
  Set Suite Variable  ${WORKING_PATH}

Spawn Appium Server
  Get Working Path
  Start Process  appium  -p  ${APPIUM_PORT}  -bp  ${BOOTSTRAP_PORT}  stdout=${WORKING_PATH}/appium-stdout.txt  shell=true
  Sleep   5

Close Appium Server
  Run Keyword And Ignore Error  Close All Applications
  Terminate All Processes             kill=True
  Sleep   5

Language selection indonesian
  Wait Until Page Contains Element     id=rb_indo
  Click Element                        id=rb_indo
  Click Element                        id=btn_next

On Boarding
  Wait Until Page Contains Element    id=layout_indicator
  Swipe By Percent                    90  50  10  50
  Swipe By Percent                    90  50  10  50
  Swipe By Percent                    90  50  10  50
  Wait Until Page Contains Element    id=tv_login
  Click Element                       id=tv_login

Input correct email 
  Wait Until Page Contains Element     id=edt_email
  Click Element                        id=edt_email
  Clear Text                           id=edt_email
  Input Text                           id=edt_email  ${user_lenderkovich}
  Hide Keyboard

Input wrong email 
  Wait Until Page Contains Element     id=edt_email
  Click Element                        id=edt_email
  Clear Text                           id=edt_email
  Input Text                           id=edt_email  ${wrong email} 
  Hide Keyboard

Input correct password
  Wait Until Page Contains Element     id=edt_pass
  Click Element                        id=edt_pass
  Clear Text                           id=edt_pass
  Input Password                       id=edt_pass   ${pass2} 
  Hide Keyboard

Input wrong password
  Wait Until Page Contains Element     id=edt_pass
  Click Element                        id=edt_pass
  Clear Text                           id=edt_pass
  Input Password                       id=edt_pass   ${wrong_pass} 
  Hide Keyboard

Random first name     
  ${random_username} =  Generate Random String    length=12    chars=[LETTERS]
  Set Suite Variable  ${random_username}
  Input Text                          id=edt_full_name  ${random_username}
  Hide Keyboard

Random phone number
  ${phone_number} =  Generate Random String    length=10    chars=[NUMBERS]
  Clear Text                id=edt_phone_number
  Click Element             id=edt_phone_number
  Input Text                id=edt_phone_number  ${phone_number}
  Hide Keyboard

Choose Nationality indonesian
  Click Element                        id=tv_country
  Wait Until Page Contains Element     id=et_search
  Click Element                        id=et_search
  Clear Text                           id=et_search
  Input Text                           id=et_search     Indonesia
  Hide Keyboard
  Click Element                        id=tv_value

Random email
  Wait Until Page Contains Element  id=edt_email
  ${random_email} =                 Generate Random String    length=10    chars=[LETTERS]
  Clear Text                        id=edt_email
  Click Element                     id=edt_email
  Input Text                        id=edt_email  ${random_email}@yopmail.com
  Hide Keyboard             
 

