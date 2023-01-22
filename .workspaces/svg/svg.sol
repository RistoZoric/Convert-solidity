// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract SimpleStorage {

    uint number;
    string component="";
    uint svgScale=0;

    function set(uint n) public {
        number=n;
        string memory svgHeader = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 1024 1024" style="enable-background:new 0 0 1024 1024;" xml:space="preserve"><style type="text/css">.st0{fill:none;stroke:#ED2224;stroke-width:20;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;}</style>';
        string memory svgFooter = '</svg>';
        uint orderDel = 1000 / Math.ceilDiv(sqrt(number / 5),1);
        svgScale = 2.0 / Math.ceilDiv(sqrt(Math.ceilDiv(number , 5)),1);

        string memory totalcompnent = svgHeader;

        // uint totalvalue = number/5;
        uint numbervalue = number % 5;

        uint originX = 0;
        uint originY = 0;
        uint onlineCnt = 1000 / orderDel;
        uint i;
        for(i = 0; i < (number / 5); i++) {
            originX = i % onlineCnt;
            originY = i / onlineCnt;
            totalcompnent = concat(totalcompnent,display_svg5(originX, originY)) ;
        }

        originX = i % onlineCnt;
        originY = i / onlineCnt;
        if(numbervalue != 0) {
            if(numbervalue==1){
                totalcompnent =concat(totalcompnent,display_svg1(originX, originY));
            }else if(numbervalue==2){
                totalcompnent =concat(totalcompnent,display_svg2(originX, originY));
            }else if(numbervalue==3){
                totalcompnent =concat(totalcompnent,display_svg3(originX, originY));
            }else if(numbervalue==4){
                totalcompnent =concat(totalcompnent,display_svg4(originX, originY));
            }
        }

        totalcompnent = concat(totalcompnent,svgFooter);
        component=totalcompnent;
    } 

    function get() public view returns (string memory) {
        return component;
    }

    //display funtions
    function display_svg1(uint del_x,uint  del_y)  public view returns (string memory) {
      return  string(abi.encodePacked(
            "<path class='st0' d='M",Strings.toString(262 + 512*del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-27.87,221.7-2.59,289.11' style='transform:scale(",Strings.toString( svgScale ),")'/>"));
    }
    function display_svg2(uint del_x,uint  del_y)  public view returns (string memory) {
      return  string(abi.encodePacked(
            "<path class='st0' d='M",Strings.toString(221 + 512 * del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-27.87,221.7-2.59,289.11' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(290 + 512 * del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-8.43,208.73,13.61,280.69' style='transform:scale(",Strings.toString( svgScale ),")'/>"));
    }
    function display_svg3(uint del_x,uint  del_y)  public view returns (string memory) {
      return  string(abi.encodePacked(
            "<path class='st0' d='M",Strings.toString(189 + 512 * del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-27.87,221.7-2.59,289.11' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(258 + 512 * del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-8.43,208.73,13.61,280.69' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(326 + 512 * del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-10.11,191.23,8.68,265.13' style='transform:scale(",Strings.toString( svgScale ),")'/>"));
    }
    function display_svg4(uint del_x,uint  del_y)  public view returns (string memory) {
      return  string(abi.encodePacked(
            "<path class='st0' d='M",Strings.toString(145 + 512*del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-27.87,221.7-2.59,289.11' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(214 + 512*del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-8.43,208.73,13.61,280.69' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(283 + 512*del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-10.11,191.23,8.68,265.13' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(356 + 512*del_x),",",Strings.toString(107 + 512 * del_y),"c0,0,0.63,219.1,5.7,300.78' style='transform:scale(",Strings.toString( svgScale ),")'/>"));
    }
    function display_svg5(uint del_x,uint  del_y)  public view returns (string memory) {
      return  string(abi.encodePacked(abi.encodePacked(
            "<path class='st0' d='M",Strings.toString(145 + 512*del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-27.87,221.7-2.59,289.11' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(214 + 512*del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-8.43,208.73,13.61,280.69' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(282 + 512*del_x),",",Strings.toString(103 + 512 * del_y),"c0,0-10.11,191.23,8.68,265.13' style='transform:scale(",Strings.toString( svgScale ),")'/>",
            "<path class='st0' d='M",Strings.toString(356 + 512*del_x),",",Strings.toString(107 + 512 * del_y),"c0,0,0.63,219.1,5.7,300.78' style='transform:scale(",Strings.toString( svgScale ),")'/>"),
            "<path class='st0' d='M",Strings.toString(78 + 512*del_x),",",Strings.toString(315 + 512 * del_y),"c0,0,12.96-78.44,355.88-152.34' style='transform:scale(",Strings.toString( svgScale ),")'/>"));
    }
    //Sqrt function 
    function sqrt(uint x) public pure returns(uint) {
        uint z = (x + 1 ) / 2; 
        uint y = x; 
        while(z < y)
            { 
                y = z; 
                z = ( x / z + z ) / 2; 
            } 
        return y; 
    }
    //funtion that concate  strings in solidty
     function concat(string memory a,string memory b) public pure returns (string memory){
        return string(abi.encodePacked(a,' ',b));
    } 
}