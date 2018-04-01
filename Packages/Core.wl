(* ::Package:: *)
(* ::Title:: *)
(*Example(样板包)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template*)
(**)
(* ::Text:: *)
(*Author:GalAster*)
(*Creation Date:20180206*)
(*Copyright:CC4.0 BY+NA+NC*)
(* ::Program:: *)
(*该项许可协议规定*)
(*1.只要您注明该作作者的姓名并在以该作的作品为基础创作的新作品上适用同一类型的许可协议*)
(*  就可基于非商业目的对我的作品重新编排、节选或者以我的作品为基础进行创作*)
(*2.基于我的作品创作的所有新作品都要适用同一类型的许可协议*)
(*3.任何以我的原作为基础创作的演绎作品自然同样都不得进行商业性使用*)
(* ::Text:: *)
(*Illusory包的通用函数*)
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Core$Illusory::usage = "Illusory包的核心函数";
CostEcho::usage = "";
Begin["`Core`"];
(* ::Subsection::Closed:: *)
(*主体代码*)
Package$Version = "V1.0";
Package$LastUpdate = "2018-01-06";
(* ::Subsubsection:: *)
(*CostEcho*)
getMemory := N@UnitConvert[Quantity[MemoryInUse[], "Bytes"], "Megabytes"];
SetAttributes[CostEcho, {HoldAll}];
CostEcho[expr_] := Block[
	{allt, cput, ans, now},
	allt = AbsoluteTime[];
	now = getMemory;
	{cput, ans} = Timing@expr;
	Echo[Quantity[cput, "Seconds"], "CPU Time: "];
	Echo[getMemory - now, "Memory used: "];
	CellPrint[ExpressionCell[ans, "Output"]];
	Echo[AbsoluteTime[] - allt, "All Time: "];
	ans;
];



(* ::Subsubsection:: *)
(*功能块 2*)
ExampleFunction[2] = "我就是个示例函数,什么功能都没有";


(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{CostEcho},
	{Protected, ReadProtected}
];
End[]