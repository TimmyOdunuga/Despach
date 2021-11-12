pragma solidity >=0.7.0 <0.9.0;
// SPDX-License-Identifier: GPL-3.0

import './Owner.sol';
import './EternalStorage.sol';
import './StringCompare.sol';
import './MailBox.sol';



contract Despash{
    
    using MailBox for address;
    using StringCompare for string;
    
    //Eternal storage contract holder and address
    EternalStorage private _EternalStorage;
    address private eternalStorageAddress;
    
    
    //constructor take in EternalStorage address
    constructor(address _eternalStorageAddress){
        eternalStorageAddress = _eternalStorageAddress;
        _EternalStorage = EternalStorage(eternalStorageAddress);
    }
    
    
    
     modifier containsMeta(string memory what, string memory where, string memory error) {
        bytes memory whatBytes = bytes (what);
        bytes memory whereBytes = bytes (where);
    
        bool found = false;
        
        for (uint i = 0; i < whereBytes.length - whatBytes.length; i++) {
            bool flag = true;
            for (uint j = 0; j < whatBytes.length; j++)
                if (whereBytes [i + j] != whatBytes [j]) {
                    flag = false;
                    break;
                }
            if (flag) {
                found = true;
                break;
            }
        }
        require (found, error);
        _;
    }
    
    
    
    modifier containsSenderAddress(address what, string memory where, string memory error) {
        bytes memory whatBytes = bytes (abi.encode(what));
        bytes memory whereBytes = bytes (where);
    
        bool found = false;
        
        for (uint i = 0; i < whereBytes.length - whatBytes.length; i++) {
            bool flag = true;
            for (uint j = 0; j < whatBytes.length; j++)
                if (whereBytes [i + j] != whatBytes [j]) {
                    flag = false;
                    break;
                }
            if (flag) {
                found = true;
                break;
            }
        }
        require (found, error);
        _;
    }





    //Send new Email
    function sendMail(address _to, string memory msgMetadata)public
        containsMeta('message":', msgMetadata, "message: is required in message metadata")
        containsMeta('from":', msgMetadata, "from: is required in message metadata")
        // containsMeta('attachmentURI:', msgMetadata, "attachmentURI: is required in message metadata. Can be set to NULL if non")
        // containsMeta('timestamp:', msgMetadata, "timestamp: is required in message metadata, and cannot be null")
    {
        eternalStorageAddress._sendMail(msg.sender,_to, msgMetadata);
    }
    
    
    function getMail(string memory mail)public view returns(string[] memory){
        require(mail.triplePair("inbox", "sent"), "ONLY INBOX OR SENT MAIL");
        return(eternalStorageAddress._getMailList(msg.sender, mail));
    }
    
    //Batch send
    function sendBatchMail(address[] memory _to, string[] memory msgMetadata)public{
        require(_to.length == msgMetadata.length, "LENGTH OF ADDRESS IS NOT EQUAL TO MESAAGE METADATA");
        for(uint i= 0; i < _to.length; i++){
            eternalStorageAddress._sendMail(msg.sender,_to[i], msgMetadata[i]);
        }
    }
    
    // revert non defined functions 
    fallback() payable external{
        if(msg.data.length > 0){
            revert('No function');
        }
    }
    receive() external payable {
        // custom function code
    }
    
}




// contract Tabula{
    
//     string json;
    
     
//     function store(string memory _json) public {
//         json = _json;
//     }
 
   
//     function retrieve() public view returns (string memory ){
//         return json;
//     }
    //inbox structure, map of inbox mails
    // struct Inbox { 
    //     string message;
    //     uint256 date;
    //     address sender;
    //     ReadStatus read;
    //     bool exists;
    // }
    
    
    // //inbox structure, map of inbox mails
    // struct Sent {  
    //     string message;
    //     uint256 date;
    //     address receiver;
    //     bool exists;
    // }
    
    
    // enum ReadStatus{
    //     _false,
    //     _true
    // }
    
    
    // //array of inbox mail
    // Inbox[] internal inboxList;
    
    // //array of sent mail
    // Sent[] internal sentList;
    
    
    // //new black mail sent, event created
    // event BlackMailSent(address from, address to);
    
    
    // //map through inbox
    // mapping(address =>  Inbox[]) internal inbox;
    
    // //get message
    // mapping(address =>  Sent[]) internal sent;
    
    
    
    // //send mail to receiver
    // function send(string memory message, address to ) public{
        
    //     //avoid sending email to self
    //     require(to != msg.sender, "You can't send a mail to yourself");
        
    //     //set senders inbox
    //     Inbox memory newMail = Inbox(message, block.timestamp,  msg.sender, ReadStatus._false, true );
        
    //     inbox[to].push(newMail);
        
    //     //add to sender's sent box
    //     addSent(message, to);
        
    //     //emit event
    //     emit BlackMailSent(msg.sender, to);
    // }
    
    
    // //add sent mail to sender's sent
    // function addSent(string memory message, address receiver) internal{
        
    //     Sent memory newSent = Sent(message, block.timestamp, receiver, true );
        
    //     sent[msg.sender].push(newSent);
    // }
    
    
    
    // //Inbox view
    // //view list of inbox mail
    // function inboxMailList() public view returns(Inbox[] memory){
        
    //     return(inbox[msg.sender]);
    // }
    
    
    // //view selected inbox mail
    // function inboxMail( uint index) public view returns(Inbox memory ){
        
    //     require(index >= 0, "PLEASE_SELECT_AN_INDEX");
    //     require(inbox[msg.sender][index].exists, "PLEASE_SELECT_A_VALID_INDEX");
        
    //     // inbox[msg.sender][index].read = true;
    //     return(inbox[msg.sender][index]);
    // }
    
    
    // //view list of sent mail
    // function sentMailList() public view returns(Sent[] memory){
        
    //     return(sent[msg.sender]);
    // }
    
    
    // //view selected sent mail
    // function sentMail( uint index) public view returns(Sent memory){
        
    //     require(index >= 0, "PLEASE_SELECT_AN_INDEX");
    //     require(sent[msg.sender][index].exists, "PLEASE_SELECT_A_VALID_INDEX");
        
    //     return(sent[msg.sender][index]);
    // }
    
// }