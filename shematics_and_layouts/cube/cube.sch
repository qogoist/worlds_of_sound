<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Arduino-clone">
<description>Arduino Clone pinheaders
By cl@xganon.com
http://www.xganon.com</description>
<packages>
<package name="NANO">
<pad name="TX0" x="5.08" y="-8.89" drill="0.8" shape="long"/>
<pad name="RX1" x="5.08" y="-6.35" drill="0.8" shape="long"/>
<pad name="RST1" x="5.08" y="-3.81" drill="0.8" shape="long"/>
<pad name="GND1" x="5.08" y="-1.27" drill="0.8" shape="long"/>
<pad name="D2" x="5.08" y="1.27" drill="0.8" shape="long"/>
<pad name="D3" x="5.08" y="3.81" drill="0.8" shape="long"/>
<pad name="D4" x="5.08" y="6.35" drill="0.8" shape="long"/>
<pad name="D5" x="5.08" y="8.89" drill="0.8" shape="long"/>
<pad name="D6" x="5.08" y="11.43" drill="0.8" shape="long"/>
<pad name="D7" x="5.08" y="13.97" drill="0.8" shape="long"/>
<pad name="D8" x="5.08" y="16.51" drill="0.8" shape="long"/>
<pad name="D9" x="5.08" y="19.05" drill="0.8" shape="long"/>
<pad name="RAW" x="-10.16" y="-8.89" drill="0.8" shape="long"/>
<pad name="GND" x="-10.16" y="-6.35" drill="0.8" shape="long"/>
<pad name="RST" x="-10.16" y="-3.81" drill="0.8" shape="long"/>
<pad name="A3" x="-10.16" y="11.43" drill="0.8" shape="long"/>
<pad name="A2" x="-10.16" y="13.97" drill="0.8" shape="long"/>
<pad name="A1" x="-10.16" y="16.51" drill="0.8" shape="long"/>
<pad name="A0" x="-10.16" y="19.05" drill="0.8" shape="long"/>
<pad name="D13" x="-10.16" y="26.67" drill="0.8" shape="long"/>
<pad name="D12" x="5.08" y="26.67" drill="0.8" shape="long"/>
<pad name="D11" x="5.08" y="24.13" drill="0.8" shape="long"/>
<pad name="D10" x="5.08" y="21.59" drill="0.8" shape="long"/>
<pad name="3.3V" x="-10.16" y="24.13" drill="0.8" shape="long" rot="R180"/>
<pad name="AREF" x="-10.16" y="21.59" drill="0.8" shape="long" rot="R180"/>
<pad name="5V" x="-10.16" y="-1.27" drill="0.8" shape="long"/>
<pad name="A4" x="-10.16" y="8.89" drill="0.8" shape="long" rot="R180"/>
<pad name="A5" x="-10.16" y="6.35" drill="0.8" shape="long" rot="R180"/>
<pad name="A6" x="-10.16" y="3.81" drill="0.8" shape="long" rot="R180"/>
<pad name="A7" x="-10.16" y="1.27" drill="0.8" shape="long" rot="R180"/>
<wire x1="-10.795" y1="-10.16" x2="-11.43" y2="-9.525" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-9.525" x2="-11.43" y2="-8.255" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-8.255" x2="-10.795" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-10.795" y1="-7.62" x2="-11.43" y2="-6.985" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-6.985" x2="-11.43" y2="-5.715" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-5.715" x2="-10.795" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-10.795" y1="-5.08" x2="-11.43" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-4.445" x2="-11.43" y2="-3.175" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-3.175" x2="-10.795" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-10.795" y1="-2.54" x2="-11.43" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-1.905" x2="-11.43" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-11.43" y1="-0.635" x2="-10.795" y2="0" width="0.127" layer="21"/>
<wire x1="-10.795" y1="0" x2="-11.43" y2="0.635" width="0.127" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-11.43" y2="1.905" width="0.127" layer="21"/>
<wire x1="-11.43" y1="1.905" x2="-10.795" y2="2.54" width="0.127" layer="21"/>
<wire x1="-10.795" y1="2.54" x2="-11.43" y2="3.175" width="0.127" layer="21"/>
<wire x1="-11.43" y1="3.175" x2="-11.43" y2="4.445" width="0.127" layer="21"/>
<wire x1="-11.43" y1="4.445" x2="-10.795" y2="5.08" width="0.127" layer="21"/>
<wire x1="-10.795" y1="5.08" x2="-11.43" y2="5.715" width="0.127" layer="21"/>
<wire x1="-11.43" y1="5.715" x2="-11.43" y2="6.985" width="0.127" layer="21"/>
<wire x1="-11.43" y1="6.985" x2="-10.795" y2="7.62" width="0.127" layer="21"/>
<wire x1="-10.795" y1="7.62" x2="-11.43" y2="8.255" width="0.127" layer="21"/>
<wire x1="-11.43" y1="8.255" x2="-11.43" y2="9.525" width="0.127" layer="21"/>
<wire x1="-11.43" y1="9.525" x2="-10.795" y2="10.16" width="0.127" layer="21"/>
<wire x1="-10.795" y1="10.16" x2="-11.43" y2="10.795" width="0.127" layer="21"/>
<wire x1="-11.43" y1="10.795" x2="-11.43" y2="12.065" width="0.127" layer="21"/>
<wire x1="-11.43" y1="12.065" x2="-10.795" y2="12.7" width="0.127" layer="21"/>
<wire x1="-10.795" y1="12.7" x2="-11.43" y2="13.335" width="0.127" layer="21"/>
<wire x1="-11.43" y1="13.335" x2="-11.43" y2="14.605" width="0.127" layer="21"/>
<wire x1="-11.43" y1="14.605" x2="-10.795" y2="15.24" width="0.127" layer="21"/>
<wire x1="-10.795" y1="15.24" x2="-11.43" y2="15.875" width="0.127" layer="21"/>
<wire x1="-11.43" y1="15.875" x2="-11.43" y2="17.145" width="0.127" layer="21"/>
<wire x1="-11.43" y1="17.145" x2="-10.795" y2="17.78" width="0.127" layer="21"/>
<wire x1="-10.795" y1="17.78" x2="-11.43" y2="18.415" width="0.127" layer="21"/>
<wire x1="-11.43" y1="18.415" x2="-11.43" y2="19.685" width="0.127" layer="21"/>
<wire x1="-11.43" y1="19.685" x2="-10.795" y2="20.32" width="0.127" layer="21"/>
<wire x1="-10.795" y1="20.32" x2="-11.43" y2="20.955" width="0.127" layer="21"/>
<wire x1="-11.43" y1="20.955" x2="-11.43" y2="22.225" width="0.127" layer="21"/>
<wire x1="-11.43" y1="22.225" x2="-10.795" y2="22.86" width="0.127" layer="21"/>
<wire x1="-10.795" y1="22.86" x2="-11.43" y2="23.495" width="0.127" layer="21"/>
<wire x1="-11.43" y1="23.495" x2="-11.43" y2="24.765" width="0.127" layer="21"/>
<wire x1="-11.43" y1="24.765" x2="-10.795" y2="25.4" width="0.127" layer="21"/>
<wire x1="-10.795" y1="25.4" x2="-11.43" y2="26.035" width="0.127" layer="21"/>
<wire x1="-11.43" y1="26.035" x2="-11.43" y2="27.305" width="0.127" layer="21"/>
<wire x1="-11.43" y1="27.305" x2="-10.795" y2="27.94" width="0.127" layer="21"/>
<wire x1="-10.795" y1="27.94" x2="-9.525" y2="27.94" width="0.127" layer="21"/>
<wire x1="-9.525" y1="27.94" x2="-8.89" y2="27.305" width="0.127" layer="21"/>
<wire x1="-8.89" y1="27.305" x2="-8.89" y2="26.035" width="0.127" layer="21"/>
<wire x1="-8.89" y1="26.035" x2="-9.525" y2="25.4" width="0.127" layer="21"/>
<wire x1="-9.525" y1="25.4" x2="-8.89" y2="24.765" width="0.127" layer="21"/>
<wire x1="-8.89" y1="24.765" x2="-8.89" y2="23.495" width="0.127" layer="21"/>
<wire x1="-8.89" y1="23.495" x2="-9.525" y2="22.86" width="0.127" layer="21"/>
<wire x1="-9.525" y1="22.86" x2="-8.89" y2="22.225" width="0.127" layer="21"/>
<wire x1="-8.89" y1="22.225" x2="-8.89" y2="20.955" width="0.127" layer="21"/>
<wire x1="-8.89" y1="20.955" x2="-9.525" y2="20.32" width="0.127" layer="21"/>
<wire x1="-9.525" y1="20.32" x2="-8.89" y2="19.685" width="0.127" layer="21"/>
<wire x1="-8.89" y1="19.685" x2="-8.89" y2="18.415" width="0.127" layer="21"/>
<wire x1="-8.89" y1="18.415" x2="-9.525" y2="17.78" width="0.127" layer="21"/>
<wire x1="-9.525" y1="17.78" x2="-8.89" y2="17.145" width="0.127" layer="21"/>
<wire x1="-8.89" y1="17.145" x2="-8.89" y2="15.875" width="0.127" layer="21"/>
<wire x1="-8.89" y1="15.875" x2="-9.525" y2="15.24" width="0.127" layer="21"/>
<wire x1="-9.525" y1="15.24" x2="-8.89" y2="14.605" width="0.127" layer="21"/>
<wire x1="-8.89" y1="14.605" x2="-8.89" y2="13.335" width="0.127" layer="21"/>
<wire x1="-8.89" y1="13.335" x2="-9.525" y2="12.7" width="0.127" layer="21"/>
<wire x1="-9.525" y1="12.7" x2="-8.89" y2="12.065" width="0.127" layer="21"/>
<wire x1="-8.89" y1="12.065" x2="-8.89" y2="10.795" width="0.127" layer="21"/>
<wire x1="-8.89" y1="10.795" x2="-9.525" y2="10.16" width="0.127" layer="21"/>
<wire x1="-9.525" y1="10.16" x2="-8.89" y2="9.525" width="0.127" layer="21"/>
<wire x1="-8.89" y1="9.525" x2="-8.89" y2="8.255" width="0.127" layer="21"/>
<wire x1="-8.89" y1="8.255" x2="-9.525" y2="7.62" width="0.127" layer="21"/>
<wire x1="-9.525" y1="7.62" x2="-8.89" y2="6.985" width="0.127" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="5.715" width="0.127" layer="21"/>
<wire x1="-8.89" y1="5.715" x2="-9.525" y2="5.08" width="0.127" layer="21"/>
<wire x1="-9.525" y1="5.08" x2="-8.89" y2="4.445" width="0.127" layer="21"/>
<wire x1="-8.89" y1="4.445" x2="-8.89" y2="3.175" width="0.127" layer="21"/>
<wire x1="-8.89" y1="3.175" x2="-9.525" y2="2.54" width="0.127" layer="21"/>
<wire x1="-9.525" y1="2.54" x2="-8.89" y2="1.905" width="0.127" layer="21"/>
<wire x1="-8.89" y1="1.905" x2="-8.89" y2="0.635" width="0.127" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-9.525" y2="0" width="0.127" layer="21"/>
<wire x1="-9.525" y1="0" x2="-8.89" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-0.635" x2="-8.89" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-1.905" x2="-9.525" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-9.525" y1="-2.54" x2="-8.89" y2="-3.175" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-3.175" x2="-8.89" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-4.445" x2="-9.525" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-9.525" y1="-5.08" x2="-8.89" y2="-5.715" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-5.715" x2="-8.89" y2="-6.985" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-6.985" x2="-9.525" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-9.525" y1="-7.62" x2="-8.89" y2="-8.255" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-8.255" x2="-8.89" y2="-9.525" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-9.525" x2="-9.525" y2="-10.16" width="0.127" layer="21"/>
<wire x1="-9.525" y1="-10.16" x2="-10.795" y2="-10.16" width="0.127" layer="21"/>
<wire x1="4.445" y1="-10.16" x2="5.715" y2="-10.16" width="0.127" layer="21"/>
<wire x1="4.445" y1="-10.16" x2="3.81" y2="-9.525" width="0.127" layer="21"/>
<wire x1="3.81" y1="-9.525" x2="3.81" y2="-8.255" width="0.127" layer="21"/>
<wire x1="3.81" y1="-8.255" x2="4.445" y2="-7.62" width="0.127" layer="21"/>
<wire x1="4.445" y1="-7.62" x2="3.81" y2="-6.985" width="0.127" layer="21"/>
<wire x1="3.81" y1="-6.985" x2="3.81" y2="-5.715" width="0.127" layer="21"/>
<wire x1="3.81" y1="-5.715" x2="4.445" y2="-5.08" width="0.127" layer="21"/>
<wire x1="4.445" y1="-5.08" x2="3.81" y2="-4.445" width="0.127" layer="21"/>
<wire x1="3.81" y1="-4.445" x2="3.81" y2="-3.175" width="0.127" layer="21"/>
<wire x1="3.81" y1="-3.175" x2="4.445" y2="-2.54" width="0.127" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="3.81" y2="-1.905" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="-0.635" width="0.127" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="4.445" y2="0" width="0.127" layer="21"/>
<wire x1="4.445" y1="0" x2="3.81" y2="0.635" width="0.127" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="1.905" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.905" x2="4.445" y2="2.54" width="0.127" layer="21"/>
<wire x1="4.445" y1="2.54" x2="3.81" y2="3.175" width="0.127" layer="21"/>
<wire x1="3.81" y1="3.175" x2="3.81" y2="4.445" width="0.127" layer="21"/>
<wire x1="3.81" y1="4.445" x2="4.445" y2="5.08" width="0.127" layer="21"/>
<wire x1="4.445" y1="5.08" x2="3.81" y2="5.715" width="0.127" layer="21"/>
<wire x1="3.81" y1="5.715" x2="3.81" y2="6.985" width="0.127" layer="21"/>
<wire x1="3.81" y1="6.985" x2="4.445" y2="7.62" width="0.127" layer="21"/>
<wire x1="4.445" y1="7.62" x2="3.81" y2="8.255" width="0.127" layer="21"/>
<wire x1="3.81" y1="8.255" x2="3.81" y2="9.525" width="0.127" layer="21"/>
<wire x1="3.81" y1="9.525" x2="4.445" y2="10.16" width="0.127" layer="21"/>
<wire x1="4.445" y1="10.16" x2="3.81" y2="10.795" width="0.127" layer="21"/>
<wire x1="3.81" y1="10.795" x2="3.81" y2="12.065" width="0.127" layer="21"/>
<wire x1="3.81" y1="12.065" x2="4.445" y2="12.7" width="0.127" layer="21"/>
<wire x1="4.445" y1="12.7" x2="3.81" y2="13.335" width="0.127" layer="21"/>
<wire x1="3.81" y1="13.335" x2="3.81" y2="14.605" width="0.127" layer="21"/>
<wire x1="3.81" y1="14.605" x2="4.445" y2="15.24" width="0.127" layer="21"/>
<wire x1="4.445" y1="15.24" x2="3.81" y2="15.875" width="0.127" layer="21"/>
<wire x1="3.81" y1="15.875" x2="3.81" y2="17.145" width="0.127" layer="21"/>
<wire x1="3.81" y1="17.145" x2="4.445" y2="17.78" width="0.127" layer="21"/>
<wire x1="4.445" y1="17.78" x2="3.81" y2="18.415" width="0.127" layer="21"/>
<wire x1="3.81" y1="18.415" x2="3.81" y2="19.685" width="0.127" layer="21"/>
<wire x1="3.81" y1="19.685" x2="4.445" y2="20.32" width="0.127" layer="21"/>
<wire x1="4.445" y1="20.32" x2="3.81" y2="20.955" width="0.127" layer="21"/>
<wire x1="3.81" y1="20.955" x2="3.81" y2="22.225" width="0.127" layer="21"/>
<wire x1="3.81" y1="22.225" x2="4.445" y2="22.86" width="0.127" layer="21"/>
<wire x1="4.445" y1="22.86" x2="3.81" y2="23.495" width="0.127" layer="21"/>
<wire x1="3.81" y1="23.495" x2="3.81" y2="24.765" width="0.127" layer="21"/>
<wire x1="3.81" y1="24.765" x2="4.445" y2="25.4" width="0.127" layer="21"/>
<wire x1="4.445" y1="25.4" x2="3.81" y2="26.035" width="0.127" layer="21"/>
<wire x1="3.81" y1="26.035" x2="3.81" y2="27.305" width="0.127" layer="21"/>
<wire x1="3.81" y1="27.305" x2="4.445" y2="27.94" width="0.127" layer="21"/>
<wire x1="4.445" y1="27.94" x2="5.715" y2="27.94" width="0.127" layer="21"/>
<wire x1="5.715" y1="27.94" x2="6.35" y2="27.305" width="0.127" layer="21"/>
<wire x1="6.35" y1="27.305" x2="6.35" y2="26.035" width="0.127" layer="21"/>
<wire x1="6.35" y1="26.035" x2="5.715" y2="25.4" width="0.127" layer="21"/>
<wire x1="5.715" y1="25.4" x2="6.35" y2="24.765" width="0.127" layer="21"/>
<wire x1="6.35" y1="24.765" x2="6.35" y2="23.495" width="0.127" layer="21"/>
<wire x1="6.35" y1="23.495" x2="5.715" y2="22.86" width="0.127" layer="21"/>
<wire x1="5.715" y1="22.86" x2="6.35" y2="22.225" width="0.127" layer="21"/>
<wire x1="6.35" y1="22.225" x2="6.35" y2="20.955" width="0.127" layer="21"/>
<wire x1="6.35" y1="20.955" x2="5.715" y2="20.32" width="0.127" layer="21"/>
<wire x1="5.715" y1="20.32" x2="6.35" y2="19.685" width="0.127" layer="21"/>
<wire x1="6.35" y1="19.685" x2="6.35" y2="18.415" width="0.127" layer="21"/>
<wire x1="6.35" y1="18.415" x2="5.715" y2="17.78" width="0.127" layer="21"/>
<wire x1="5.715" y1="17.78" x2="6.35" y2="17.145" width="0.127" layer="21"/>
<wire x1="6.35" y1="17.145" x2="6.35" y2="15.875" width="0.127" layer="21"/>
<wire x1="6.35" y1="15.875" x2="5.715" y2="15.24" width="0.127" layer="21"/>
<wire x1="5.715" y1="15.24" x2="6.35" y2="14.605" width="0.127" layer="21"/>
<wire x1="6.35" y1="14.605" x2="6.35" y2="13.335" width="0.127" layer="21"/>
<wire x1="6.35" y1="13.335" x2="5.715" y2="12.7" width="0.127" layer="21"/>
<wire x1="5.715" y1="12.7" x2="6.35" y2="12.065" width="0.127" layer="21"/>
<wire x1="6.35" y1="12.065" x2="6.35" y2="10.795" width="0.127" layer="21"/>
<wire x1="6.35" y1="10.795" x2="5.715" y2="10.16" width="0.127" layer="21"/>
<wire x1="5.715" y1="10.16" x2="6.35" y2="9.525" width="0.127" layer="21"/>
<wire x1="6.35" y1="9.525" x2="6.35" y2="8.255" width="0.127" layer="21"/>
<wire x1="6.35" y1="8.255" x2="5.715" y2="7.62" width="0.127" layer="21"/>
<wire x1="5.715" y1="7.62" x2="6.35" y2="6.985" width="0.127" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="5.715" width="0.127" layer="21"/>
<wire x1="6.35" y1="5.715" x2="5.715" y2="5.08" width="0.127" layer="21"/>
<wire x1="5.715" y1="5.08" x2="6.35" y2="4.445" width="0.127" layer="21"/>
<wire x1="6.35" y1="4.445" x2="6.35" y2="3.175" width="0.127" layer="21"/>
<wire x1="6.35" y1="3.175" x2="5.715" y2="2.54" width="0.127" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.35" y2="1.905" width="0.127" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="0.635" width="0.127" layer="21"/>
<wire x1="6.35" y1="0.635" x2="5.715" y2="0" width="0.127" layer="21"/>
<wire x1="5.715" y1="0" x2="6.35" y2="-0.635" width="0.127" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="6.35" y2="-1.905" width="0.127" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="5.715" y2="-2.54" width="0.127" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.35" y2="-3.175" width="0.127" layer="21"/>
<wire x1="6.35" y1="-3.175" x2="6.35" y2="-4.445" width="0.127" layer="21"/>
<wire x1="6.35" y1="-4.445" x2="5.715" y2="-5.08" width="0.127" layer="21"/>
<wire x1="5.715" y1="-5.08" x2="6.35" y2="-5.715" width="0.127" layer="21"/>
<wire x1="6.35" y1="-5.715" x2="6.35" y2="-6.985" width="0.127" layer="21"/>
<wire x1="6.35" y1="-6.985" x2="5.715" y2="-7.62" width="0.127" layer="21"/>
<wire x1="5.715" y1="-7.62" x2="6.35" y2="-8.255" width="0.127" layer="21"/>
<wire x1="6.35" y1="-8.255" x2="6.35" y2="-9.525" width="0.127" layer="21"/>
<wire x1="6.35" y1="-9.525" x2="5.715" y2="-10.16" width="0.127" layer="21"/>
<wire x1="5.715" y1="-10.16" x2="4.445" y2="-10.16" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="NANO">
<pin name="3.3V" x="-22.86" y="12.7" visible="pin" length="middle"/>
<pin name="AREF" x="-22.86" y="10.16" visible="pin" length="middle"/>
<pin name="TX0" x="10.16" y="-20.32" visible="pin" length="middle" rot="R180"/>
<pin name="RX1" x="10.16" y="-17.78" visible="pin" length="middle" rot="R180"/>
<pin name="RST1" x="10.16" y="-15.24" visible="pin" length="middle" rot="R180"/>
<pin name="GND2" x="10.16" y="-12.7" visible="pin" length="middle" rot="R180"/>
<pin name="D2" x="10.16" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="D3" x="10.16" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="D4" x="10.16" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="D5" x="10.16" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D6" x="10.16" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="D7" x="10.16" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D8" x="10.16" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="D9" x="10.16" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="RAW" x="-22.86" y="-20.32" visible="pin" length="middle"/>
<pin name="GND" x="-22.86" y="-17.78" visible="pin" length="middle"/>
<pin name="RST" x="-22.86" y="-15.24" visible="pin" length="middle"/>
<pin name="5.5V" x="-22.86" y="-12.7" visible="pin" length="middle"/>
<pin name="A3" x="-22.86" y="0" visible="pin" length="middle"/>
<pin name="A2" x="-22.86" y="2.54" visible="pin" length="middle"/>
<pin name="A1" x="-22.86" y="5.08" visible="pin" length="middle"/>
<pin name="A0" x="-22.86" y="7.62" visible="pin" length="middle"/>
<pin name="D13" x="-22.86" y="15.24" visible="pin" length="middle"/>
<pin name="D12" x="10.16" y="15.24" visible="pin" length="middle" rot="R180"/>
<pin name="D11" x="10.16" y="12.7" visible="pin" length="middle" rot="R180"/>
<pin name="D10" x="10.16" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="A7" x="-22.86" y="-10.16" visible="pin" length="middle"/>
<pin name="A6" x="-22.86" y="-7.62" visible="pin" length="middle"/>
<pin name="A5" x="-22.86" y="-5.08" visible="pin" length="middle"/>
<pin name="A4" x="-22.86" y="-2.54" visible="pin" length="middle"/>
<wire x1="-17.78" y1="17.78" x2="-17.78" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-30.48" x2="5.08" y2="-30.48" width="0.254" layer="94"/>
<wire x1="5.08" y1="-30.48" x2="5.08" y2="17.78" width="0.254" layer="94"/>
<wire x1="5.08" y1="17.78" x2="-17.78" y2="17.78" width="0.254" layer="94"/>
<text x="-12.7" y="20.32" size="1.778" layer="95">Arduino Nano</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="NANO">
<description>Arduino Nano</description>
<gates>
<gate name="G$1" symbol="NANO" x="7.62" y="2.54"/>
</gates>
<devices>
<device name="" package="NANO">
<connects>
<connect gate="G$1" pin="3.3V" pad="3.3V"/>
<connect gate="G$1" pin="5.5V" pad="5V"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4" pad="A4"/>
<connect gate="G$1" pin="A5" pad="A5"/>
<connect gate="G$1" pin="A6" pad="A6"/>
<connect gate="G$1" pin="A7" pad="A7"/>
<connect gate="G$1" pin="AREF" pad="AREF"/>
<connect gate="G$1" pin="D10" pad="D10"/>
<connect gate="G$1" pin="D11" pad="D11"/>
<connect gate="G$1" pin="D12" pad="D12"/>
<connect gate="G$1" pin="D13" pad="D13"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="D9" pad="D9"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="GND2" pad="GND1"/>
<connect gate="G$1" pin="RAW" pad="RAW"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RST1" pad="RST1"/>
<connect gate="G$1" pin="RX1" pad="RX1"/>
<connect gate="G$1" pin="TX0" pad="TX0"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VCC">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VCC" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-lstb">
<description>&lt;b&gt;Pin Headers&lt;/b&gt;&lt;p&gt;
Naming:&lt;p&gt;
MA = male&lt;p&gt;
# contacts - # rows&lt;p&gt;
W = angled&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="MA03-1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.81" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-3.81" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="MA03-1">
<wire x1="3.81" y1="-5.08" x2="-1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<text x="-1.27" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MA03-1" prefix="SV" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="MA03-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MA03-1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="solpad">
<description>&lt;b&gt;Solder Pads/Test Points&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="MCS08">
<description>&lt;b&gt;SOLDER PAD&lt;/b&gt;&lt;p&gt;
drill 1.2 mm</description>
<wire x1="-1.397" y1="0.508" x2="-1.397" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.508" y1="-1.397" x2="1.397" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.508" y1="1.397" x2="1.397" y2="0.508" width="0.1524" layer="21"/>
<wire x1="1.397" y1="0.508" x2="1.397" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="0.508" x2="-0.508" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="1.397" x2="0.508" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="-1.397" x2="-1.397" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.508" y1="-1.397" x2="-0.508" y2="-1.397" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.381" width="0.254" layer="51"/>
<pad name="MP" x="0" y="0" drill="1.1938" diameter="2.159" shape="octagon"/>
<text x="-1.27" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0.381" size="0.0254" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="LSP">
<wire x1="-1.016" y1="2.032" x2="1.016" y2="0" width="0.254" layer="94"/>
<wire x1="-1.016" y1="0" x2="1.016" y2="2.032" width="0.254" layer="94"/>
<circle x="0" y="1.016" radius="1.016" width="0.4064" layer="94"/>
<text x="-1.27" y="2.921" size="1.778" layer="95">&gt;NAME</text>
<pin name="MP" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MCS08" prefix="LSP">
<description>&lt;b&gt;SOLDER PAD&lt;/b&gt;&lt;p&gt; MC S0,8, drill 1.2 mm, distributor Buerklin, 08F130</description>
<gates>
<gate name="G$1" symbol="LSP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MCS08">
<connects>
<connect gate="G$1" pin="MP" pad="MP"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="A1" library="Arduino-clone" deviceset="NANO" device=""/>
<part name="VOUT+" library="solpad" deviceset="MCS08" device=""/>
<part name="VOUT-" library="solpad" deviceset="MCS08" device=""/>
<part name="VIN+" library="solpad" deviceset="MCS08" device=""/>
<part name="VIN-" library="solpad" deviceset="MCS08" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="P+1" library="supply1" deviceset="VCC" device="" value="VCC +5V"/>
<part name="P+2" library="supply1" deviceset="VCC" device="" value="VCC +5V"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="OUT+" library="solpad" deviceset="MCS08" device=""/>
<part name="B+" library="solpad" deviceset="MCS08" device=""/>
<part name="B-" library="solpad" deviceset="MCS08" device=""/>
<part name="OUT-" library="solpad" deviceset="MCS08" device=""/>
<part name="-" library="solpad" deviceset="MCS08" device=""/>
<part name="+" library="solpad" deviceset="MCS08" device=""/>
<part name="BH+" library="solpad" deviceset="MCS08" device=""/>
<part name="BH-" library="solpad" deviceset="MCS08" device=""/>
<part name="X1" library="con-lstb" deviceset="MA03-1" device="" value="LEDs"/>
<part name="P+4" library="supply1" deviceset="VCC" device="" value="VCC +5V"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="-38.1" y1="124.46" x2="-38.1" y2="109.22" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-38.1" y1="109.22" x2="-5.08" y2="109.22" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-5.08" y1="109.22" x2="-5.08" y2="124.46" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-5.08" y1="124.46" x2="-38.1" y2="124.46" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-55.88" y1="137.16" x2="-55.88" y2="109.22" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-55.88" y1="109.22" x2="-91.44" y2="109.22" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-91.44" y1="109.22" x2="-91.44" y2="137.16" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-91.44" y1="137.16" x2="-55.88" y2="137.16" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-55.88" y1="157.48" x2="-55.88" y2="142.24" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-55.88" y1="142.24" x2="-73.66" y2="142.24" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-73.66" y1="142.24" x2="-73.66" y2="157.48" width="0.1524" layer="94" style="dashdot"/>
<wire x1="-73.66" y1="157.48" x2="-55.88" y2="157.48" width="0.1524" layer="94" style="dashdot"/>
<text x="-27.94" y="78.74" size="1.778" layer="95">A1</text>
</plain>
<instances>
<instance part="A1" gate="G$1" x="-15.24" y="55.88" smashed="yes"/>
<instance part="VOUT+" gate="G$1" x="-10.16" y="119.38" smashed="yes" rot="R90">
<attribute name="NAME" x="-13.97" y="121.539" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="VOUT-" gate="G$1" x="-10.16" y="114.3" smashed="yes" rot="R90">
<attribute name="NAME" x="-13.97" y="116.459" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="VIN+" gate="G$1" x="-33.02" y="119.38" smashed="yes" rot="R270">
<attribute name="NAME" x="-29.21" y="119.761" size="1.778" layer="95"/>
</instance>
<instance part="VIN-" gate="G$1" x="-33.02" y="114.3" smashed="yes" rot="R270">
<attribute name="NAME" x="-29.21" y="114.681" size="1.778" layer="95"/>
</instance>
<instance part="GND2" gate="1" x="2.54" y="93.98"/>
<instance part="P+1" gate="VCC" x="2.54" y="137.16"/>
<instance part="P+2" gate="VCC" x="-60.96" y="48.26"/>
<instance part="GND3" gate="1" x="-55.88" y="10.16"/>
<instance part="OUT+" gate="G$1" x="-60.96" y="119.38" smashed="yes" rot="R90">
<attribute name="NAME" x="-64.77" y="121.539" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="B+" gate="G$1" x="-60.96" y="132.08" smashed="yes" rot="R90">
<attribute name="NAME" x="-64.77" y="134.239" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="B-" gate="G$1" x="-60.96" y="127" smashed="yes" rot="R90">
<attribute name="NAME" x="-64.77" y="129.159" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="OUT-" gate="G$1" x="-60.96" y="114.3" smashed="yes" rot="R90">
<attribute name="NAME" x="-64.77" y="116.459" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="-" gate="G$1" x="-86.36" y="119.38" smashed="yes" rot="R270">
<attribute name="NAME" x="-82.55" y="119.761" size="1.778" layer="95"/>
</instance>
<instance part="+" gate="G$1" x="-86.36" y="127" smashed="yes" rot="R270">
<attribute name="NAME" x="-82.55" y="127.381" size="1.778" layer="95"/>
</instance>
<instance part="BH+" gate="G$1" x="-60.96" y="152.4" smashed="yes" rot="R90">
<attribute name="NAME" x="-64.77" y="154.559" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="BH-" gate="G$1" x="-60.96" y="147.32" smashed="yes" rot="R90">
<attribute name="NAME" x="-64.77" y="149.479" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="X1" gate="G$1" x="38.1" y="66.04" rot="R180"/>
<instance part="P+4" gate="VCC" x="27.94" y="76.2"/>
<instance part="GND5" gate="1" x="27.94" y="55.88"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="VOUT-" gate="G$1" pin="MP"/>
<wire x1="-7.62" y1="114.3" x2="2.54" y2="114.3" width="0.1524" layer="91"/>
<wire x1="2.54" y1="114.3" x2="2.54" y2="96.52" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="-55.88" y1="12.7" x2="-55.88" y2="20.32" width="0.1524" layer="91"/>
<pinref part="A1" gate="G$1" pin="GND"/>
<wire x1="-55.88" y1="20.32" x2="-55.88" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-55.88" y1="38.1" x2="-38.1" y2="38.1" width="0.1524" layer="91"/>
<pinref part="A1" gate="G$1" pin="GND2"/>
<wire x1="-5.08" y1="43.18" x2="0" y2="43.18" width="0.1524" layer="91"/>
<wire x1="0" y1="43.18" x2="0" y2="20.32" width="0.1524" layer="91"/>
<wire x1="0" y1="20.32" x2="-55.88" y2="20.32" width="0.1524" layer="91"/>
<junction x="-55.88" y="20.32"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="3"/>
<wire x1="30.48" y1="63.5" x2="27.94" y2="63.5" width="0.1524" layer="91"/>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="27.94" y1="63.5" x2="27.94" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="P+1" gate="VCC" pin="VCC"/>
<wire x1="2.54" y1="134.62" x2="2.54" y2="119.38" width="0.1524" layer="91"/>
<pinref part="VOUT+" gate="G$1" pin="MP"/>
<wire x1="-7.62" y1="119.38" x2="2.54" y2="119.38" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P+2" gate="VCC" pin="VCC"/>
<pinref part="A1" gate="G$1" pin="RAW"/>
<wire x1="-38.1" y1="35.56" x2="-60.96" y2="35.56" width="0.1524" layer="91"/>
<wire x1="-60.96" y1="35.56" x2="-60.96" y2="45.72" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<wire x1="30.48" y1="68.58" x2="27.94" y2="68.58" width="0.1524" layer="91"/>
<pinref part="P+4" gate="VCC" pin="VCC"/>
<wire x1="27.94" y1="73.66" x2="27.94" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="OUT+" gate="G$1" pin="MP"/>
<pinref part="VIN+" gate="G$1" pin="MP"/>
<wire x1="-58.42" y1="119.38" x2="-35.56" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="OUT-" gate="G$1" pin="MP"/>
<wire x1="-58.42" y1="114.3" x2="-35.56" y2="114.3" width="0.1524" layer="91"/>
<pinref part="VIN-" gate="G$1" pin="MP"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="BH-" gate="G$1" pin="MP"/>
<wire x1="-58.42" y1="147.32" x2="-50.8" y2="147.32" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="147.32" x2="-50.8" y2="127" width="0.1524" layer="91"/>
<pinref part="B-" gate="G$1" pin="MP"/>
<wire x1="-50.8" y1="127" x2="-58.42" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="B+" gate="G$1" pin="MP"/>
<wire x1="-58.42" y1="132.08" x2="-45.72" y2="132.08" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="132.08" x2="-45.72" y2="152.4" width="0.1524" layer="91"/>
<pinref part="BH+" gate="G$1" pin="MP"/>
<wire x1="-45.72" y1="152.4" x2="-58.42" y2="152.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="A1" gate="G$1" pin="D10"/>
<pinref part="X1" gate="G$1" pin="2"/>
<wire x1="-5.08" y1="66.04" x2="30.48" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
