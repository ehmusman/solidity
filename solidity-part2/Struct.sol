// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract demoo {
    // Struct is a complex data type. a complex data type usually a composite of other existing data types.

    struct Student{
        string name;
        uint roll;
        bool pass;
    }
    // ////////////////////////////////// for single student //////////////////////////////////////
    // Student public s;
    // ////////////////////////////////// List of students //////////////////////////////////////
    Student[3] public students; // its like an array of objects
    // Students IDs

    // function insertStudent(string calldata _name, uint _roll, bool _pass)public{
    //     // s.name=_name;
    //     // s.roll=_roll;
    //     // s.pass=_pass;
    //     s= Student(_name,_roll,_pass);
    // }
    // function returnStudentData() public view returns(Student memory){
    //     return s;
    // }

    function insertNewStudent(uint index, string calldata _name, uint _roll, bool _pass)public{
        students[index]= Student(_name,_roll,_pass);
    }
    function accessStudentData(uint index) public view returns(Student memory){
        return students[index];
    }
}