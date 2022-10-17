//  SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

  //  Max number of whitelisted addresses allowed
  uint8 public maxWhitelistedAddresses;

  //  Create a mapping of maxWhitelistedAddresses
  //   if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
  mapping(address => bool) public whitelistedAddresses;

  //   numAddressesWhitelisted would be used to keep track of how many address have been whitelisted
  //   NOTE: Don't change this variable name, as it will be part of verification
  uint8 public numAddressesWhitelisted;

  //  Setting the Max number of whitelisted address
  //   User will put the value at the time of deployment
  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  /**
    addressToWhiteToWhitelist - This function adds the address of the sender to the whitelist
  */
  function addressToWhitelist() public {
    //  check if the user has already been whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
    //  check if the numAddressesWhitelisted < maxWhitlistedAddresses, if not throw an error.
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
    whitelistedAddresses[msg.sender] = true;
    // increase the number of whitelisted addresses
    numAddressesWhitelisted += 1;
  }

}
