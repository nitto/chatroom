<div id="singlechat1" class="singlechat"><%@include file ="singlechat1.jsp" %></div>
<div id="singlechat2" class="singlechat"><%@include file ="singlechat2.jsp" %></div>


<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>

       <div id="chata1" class="chat1"  onmousedown="move(1,'singlechat1')" onmouseup="move(2,'singlechat1')"></div>
       <div id="chata2" class="chat2">
         <div id="chata21" class="chat21"></div>
         <div id="chata26" class="chat26">
             <div id="chata261" class="chat261"></div>
             <div id="chata262" class="chat262">
                     <input name="" type="button" value="查找" onclick="showrecord('otherday',null,'chata2')"/>
                     <select name="year1" id="year1">
                       <option value="2010" selected="selected">2010</option> 
                       <option value="2011">2011</option>
                       <option value="2012">2012</option>
                     </select>年
                    <select name="month1" id="month1">
                       <option value="1" selected="selected">1</option>
                       <option value="2">2</option>
                       <option value="3">3</option>
                       <option value="4">4</option>
                       <option value="5">5</option>
                       <option value="6">6</option>
                       <option value="7">7</option>
                       <option value="8">8</option>
                       <option value="9">9</option>
                       <option value="10">10</option>
                       <option value="11">11</option>
                       <option value="12">12</option>
                    </select>月
                    <select name="day1" id="day1">
                       <option value="1" selected="selected">1</option>
                       <option value="2">2</option>
                       <option value="3">3</option>
                       <option value="4">4</option>
                       <option value="5">5</option>
                       <option value="6">6</option>
                       <option value="7">7</option>
                       <option value="8">8</option>
                       <option value="9">9</option>
                       <option value="10">10</option>
                       <option value="11">11</option>
                       <option value="12">12</option>
                       <option value="13">13</option>
                       <option value="14">14</option>
                       <option value="15">15</option>
                       <option value="16">16</option>
                       <option value="17">17</option>
                       <option value="18">18</option>
                       <option value="19">19</option>
                       <option value="20">20</option>
                       <option value="21">21</option>
                       <option value="22">22</option>
                       <option value="23">23</option>
                       <option value="24">24</option>
                       <option value="25">25</option>
                       <option value="26">26</option>
                       <option value="27">27</option>
                       <option value="28">28</option>
                       <option value="29">29</option>
                       <option value="30">30</option>
                       <option value="31">31</option>
                    </select>日
             <!-- end chata262 --></div>
         <!-- end #chata26 --></div>
       </div>
       <div id="chata4" class="chat4"></div>
       <div id="chata5" class="chat5">
           <input name="exit" type="image" src="images/21.gif" class="rwi" onclick="shutdown('singlechat1','chata2','chata21')"/>
           <input name="fasong" type="image" src="images/20.gif" class="rwi" onclick="send('chata4','fonta1','fonta2','chata2','1')"/>
           <input name="" type="image" src="images/26.gif" class="rwi" onclick="showrecord('today','chata26','chata2')"/>
       </div>
