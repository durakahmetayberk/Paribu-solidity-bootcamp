// SPDX-License-Identifier: MIT
pragma solidity >0.8.2 <0.9.0;

contract RealEstateContract{
mapping (address => mapping (uint => rentalAgreemant)) public estateLists ;


enum realEstateType {
    House,
    Office
}


struct estate {
    realEstateType theRealEstateType;
    string tenant;
    string location;
    string landlord;
    uint estateId ;
}


struct rentalAgreemant {
    bool isRent;
    estate theEstate;
    string startDate;
    string endDate;
}


function addEstate(estate memory _theEstate) public {
    estateLists[msg.sender][_theEstate.estateId] =rentalAgreemant(false, _theEstate, "0", "0");
}

function rentIt(estate memory _theEstate, string memory _startDate, string memory _endDate )  public  {
    require(estateLists[msg.sender][_theEstate.estateId].isRent == false, "The estate is already rent!");
    estateLists[msg.sender][_theEstate.estateId].isRent= true;
    estateLists[msg.sender][_theEstate.estateId].theEstate = _theEstate;
    estateLists[msg.sender][_theEstate.estateId].startDate = _startDate;
    estateLists[msg.sender][_theEstate.estateId].endDate =  _endDate;
}

function unRent(estate memory _theEstate)  public {
    require(    estateLists[msg.sender][_theEstate.estateId].isRent == true, "The estate is not rent, thus cannot be unrent!");
    estateLists[msg.sender][_theEstate.estateId].isRent= false;
    estateLists[msg.sender][_theEstate.estateId].startDate = "";
    estateLists[msg.sender][_theEstate.estateId].endDate =  "";
}
}
