xmlport 90760 "EIE CustomerXML"
{
    Direction = Export;
    Format = Xml;
    FormatEvaluate = Xml;
    schema
    {
        textelement(Root)
        {
            tableelement(Customer; Customer)
            {
                fieldattribute(Number; Customer."No.") { }
                fieldattribute(Language; Customer."Language Code") { }
                fieldattribute(Phone; Customer."Phone No.") { }
                fieldelement(Name; Customer.Name) { }
                textelement(Address)
                {
                    fieldelement(StreetAndNr; Customer.Address)
                    {
                        fieldattribute(Address2; customer."Address 2") { }
                    }
                    fieldelement(City; Customer.City)
                    {
                        fieldattribute(Zipcode; Customer."Post Code") { }
                    }
                }
                fieldelement(Phone; Customer."Phone No.") { }

            }
        }
    }
}