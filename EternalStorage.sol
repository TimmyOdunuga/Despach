pragma solidity >=0.7.0 <0.9.0;
// SPDX-License-Identifier: GPL-3.0



import './Owner.sol';



contract EternalStorage{
    
    mapping(bytes32 => uint256)    private uIntStorage;
    mapping(bytes32 => string)     private stringStorage;
    mapping(bytes32 => address)    private addressStorage;
    mapping(bytes32 => bytes)      private bytesStorage;
    mapping(bytes32 => bool)       private boolStorage;
    mapping(bytes32 => int256)     private intStorage;
    mapping(bytes32 => bytes32[])  private bytesArrayStorage;
    mapping(bytes32 => string[])   private stringArrayStorage;
    mapping(bytes32 => address[])  private addressArrayStorage;
    mapping(bytes32 => uint256[])  private uintArrayStorage;
    
    
    // *** Getter Methods ***
    function getAddress(bytes32 _key) public view returns (address) {
      return addressStorage[_key];
    }
    
    function getUint(bytes32 _key) public view returns (uint) {
      return uIntStorage[_key];
    }
    
    function getString(bytes32 _key) public view returns (string memory) {
      return stringStorage[_key];
    }
    
    function getBytes(bytes32 _key) public view returns (bytes memory) {
      return bytesStorage[_key];
    }
    
    function getBool(bytes32 _key) public view returns (bool ) {
      return boolStorage[_key];
    }
    
    function getInt(bytes32 _key) public view returns (int ) {
      return intStorage[_key];
    }
    
    function getBytesArray(bytes32 _key) public view returns (bytes32[] memory ) {
      return bytesArrayStorage[_key];
    }
    
    function getStringArray(bytes32 _key) public view returns (string[] memory ) {
      return stringArrayStorage[_key];
    }
    
    function getAddressArray(bytes32 _key) public view returns (address[] memory ) {
      return addressArrayStorage[_key];
    }
    
    function getUintArray(bytes32 _key) public view returns (uint[] memory ) {
      return uintArrayStorage[_key];
    }
    
    
     // *** Setter Methods ***
    function setUint(bytes32 _key, uint _value) public {
      uIntStorage[_key] = _value;
    }
    
    function setString(bytes32 _key, string memory _value) public {
      stringStorage[_key] = _value;
    }
    
    function setBytes(bytes32 _key, bytes memory _value) public {
      bytesStorage[_key] = _value;
    }
    function setAddress(bytes32 _key, address _value) public {
      addressStorage[_key] = _value;
    }
    
    function setBool(bytes32 _key, bool _value) public {
      boolStorage[_key] = _value;
    }
    
    function setInt(bytes32 _key, int _value) public {
      intStorage[_key] = _value;
    }
    
    function setBytesArray(bytes32 _key, bytes32 _value) public  {
       bytesArrayStorage[_key].push(_value);
    }
    
    function setStringArray(bytes32 _key, string memory _value) public {
       stringArrayStorage[_key].push(_value);
    }
    
    function setAddressArray(bytes32 _key, address _value) public {
       addressArrayStorage[_key].push(_value);
    }
    
    function setUintArray(bytes32 _key, uint256 _value) public {
       uintArrayStorage[_key].push(_value);
    }
    
    
    // *** Delete Methods ***
    function deleteUint(bytes32 _key) public {
        delete uIntStorage[_key] ;
    }
    
    function deleteString(bytes32 _key) public {
        delete stringStorage[_key];
    }
    
    function deleteBytes(bytes32 _key) public {
        delete  bytesStorage[_key];
    }
    
    function deleteBool(bytes32 _key) public {
      delete boolStorage[_key];
    }
    
    function deleteInt(bytes32 _key) public {
        delete intStorage[_key];
    }
    
    function deleteBytesArray(bytes32 _key, uint i) public  {
        delete bytesArrayStorage[_key][i];
    }
    
    function deleteStringArray(bytes32 _key, uint i) public {
        delete stringArrayStorage[_key][i];
    }
    
    function deleteAddressArray(bytes32 _key, uint i) public {
        delete addressArrayStorage[_key][i];
    }
    
    function deleteUintArray(bytes32 _key, uint i) public {
        delete uintArrayStorage[_key][i];
    }
}