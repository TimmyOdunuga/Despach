pragma solidity >=0.7.0 <0.9.0;
// SPDX-License-Identifier: GPL-3.0



import './StringCompare.sol';
import './EternalStorage.sol';


//Get mail 
library MailBox{
    
    using StringCompare for string;
    
    function _sendMail(address eternalStorage, address _from, address _to, string memory messageData) internal {
        //Inbox
        bytes32 inboxPointer =  keccak256(abi.encodePacked(_to,"inbox"));
        
        //Sent
        bytes32 sentboxPointer =  keccak256(abi.encodePacked(_from,"sent"));
        
        //set message
        EternalStorage(eternalStorage).setStringArray(inboxPointer, messageData);        
        EternalStorage(eternalStorage).setStringArray(sentboxPointer, messageData);
    }
    
    
    function _getMailList(address eternalStorage, address sender,string memory mail )
    internal view returns(string[] memory)
    {
        require(mail.triplePair("inbox", "sent"), "ONLY_INBOX_OR_SENT_MAIL");
        return(EternalStorage(eternalStorage).getStringArray(keccak256(abi.encodePacked(sender, mail))));
    }
    
    
    function _getMail(address eternalStorage,address sender, string memory mail, uint i) 
    internal view returns(string memory message)
    {
        require(mail.triplePair("inbox", "sent"), "ONLY_INBOX_OR_SENT_MAIL");
        return(EternalStorage(eternalStorage).getStringArray(keccak256(abi.encodePacked(sender, mail)))[i]);
    }
    
    // function batchSendMail() internal {}
}
