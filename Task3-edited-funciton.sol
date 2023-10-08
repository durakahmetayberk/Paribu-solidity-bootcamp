// SPDX-License-Identifier: unlicensed.

pragma solidity >=0.8.2 <0.9.0;


contract task3 {

  Account[3] public admins;
  uint private index;
  
  //the number of the admins is the index. Function creates a dynamic array with size of admins number and returns just admins without null elements
  function getAllAdmins() public view returns (Account[] memory) {
      Account[] memory _admins = new Account[](index);
      for (uint i = 0; i < index; i++) {
          _admins[i] = admins[i];
      }
      return _admins;
  }


}
