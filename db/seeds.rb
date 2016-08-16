jane = User.create name: "Jane"
peter = User.create name: "Peter"
luke = User.create name: "Luke"

jane_number = UserNumber.create user: jane, sip_endpoint: "sip:jane160813191736@phone.plivo.com"
peter_number = UserNumber.create user: peter, sip_endpoint: "sip:peter160813205904@phone.plivo.com"
luke_number = UserNumber.create user: luke, sip_endpoint: "sip:luke160813205846@phone.plivo.com"

main_office = CompanyNumber.create sip_endpoint: "sip:mainoffice160813210335@phone.plivo.com"
sales = CompanyNumber.create sip_endpoint: "sip:sales160813210359@phone.plivo.com"
support = CompanyNumber.create sip_endpoint: "sip:support160813210437@phone.plivo.com"

UserDepartment.create(
  [
    { user: jane, company_number: main_office },
    { user: peter, company_number: sales },
    { user: luke, company_number: support }
  ]
)