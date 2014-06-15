(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[    240589,       4365]
NotebookOptionsPosition[    239376,       4305]
NotebookOutlinePosition[    239928,       4328]
CellTagsIndexPosition[    239885,       4325]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[TextData[{
 "Heston Model\n",
 StyleBox["Graham Annett\n", "Subtitle"],
 StyleBox["13 December 2013 \n\n", "Subsubtitle"],
 StyleBox["Introduction\n", "Section"],
 StyleBox["In finance, the Heston model, describes the evolution of \
volatility of an underlying asset. The Heston model is a stochastic \
volatility model. The model assumes that the volatility of the asset follows \
a random process, or random walk. \n\nThe Heston Model has five independent \
parameters, all of which can be determined by calibrating to the \
market-observed prices of European options of various strikes or maturity \
dates. Once a set of parameters has been determined, you can prive other \
options (parameters are calibrated). Other European options can be priced or \
American options. The underlying asset price follows a lognormal process, the \
variance (V) follows a mean-reverting square root process:\n\nd", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["S", "t"], "=", 
    RowBox[{"rSdt", "+", 
     RowBox[{
      SqrtBox["v"], 
      SubscriptBox["SdZ", "1"]}]}]}], TraditionalForm]], "Text"], "Text"],
 StyleBox["\t\t\n", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   RowBox[{"dv", "=", 
    RowBox[{"-", 
     RowBox[{"\[Kappa]", "(", 
      RowBox[{"V", "-", 
       SubscriptBox["V", "\[Infinity]"]}]}]}]}], TraditionalForm]], "Text"], 
  "Text"],
 StyleBox[")dt+\[Omega]", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   SqrtBox["v"], TraditionalForm]], "Text"], "Text"],
 StyleBox[Cell[BoxData[
  FormBox[
   SubscriptBox["dZ", "2"], TraditionalForm]], "Text"], "Text"],
 StyleBox["\t\n\nwhere:\nr is the risk-free interest rate\n", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["dZ", "1"], " "}], TraditionalForm]], "Text",
  FontColor->GrayLevel[0]], "Text"],
 StyleBox["and ", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   SubscriptBox["dZ", "2"], TraditionalForm]], "Text",
  FontColor->GrayLevel[0]], "Text"],
 StyleBox[" are two correlated standard Brownian motions \n\n5 Parameters \
are:\n", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   SubscriptBox["V", "0"], TraditionalForm]], "Text",
  FontColor->GrayLevel[0]], "Text"],
 StyleBox["=initial variance\n", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   SubscriptBox["V", "\[Infinity]"], TraditionalForm]], "Text",
  FontColor->GrayLevel[0]], "Text"],
 StyleBox["= long-run variance\n\[Kappa] = speed of mean reversion\n\[Omega] \
= volatility of volatility \n\[Rho] = correlation \n\nIn General, the price \
at time (t) of a European call options maturity date at time (T) is given by \
the discounted expected value:\n\n", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["C", "T"], " ", "=", " ", 
    RowBox[{
     RowBox[{
      SuperscriptBox[
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{"-", 
         RowBox[{"r", "(", 
          RowBox[{"T", "-", "t"}], ")"}]}]], " "], " ", 
      RowBox[{
       SubsuperscriptBox["\[Integral]", "0", "\[Infinity]"], 
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox["\[ExponentialE]", "x"], "-", "K"}], ")"}]}]}], "+", 
     RowBox[{
      RowBox[{"p", "(", "x", ")"}], 
      RowBox[{"\[DifferentialD]", "x"}]}]}]}], TraditionalForm]], "Text",
  FontColor->GrayLevel[0]], "Text"],
 StyleBox["\nWhere ", "Text",
  FontColor->GrayLevel[0]],
 StyleBox[Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{"Log", "[", "s", "]"}], "=", "x", " "}], TraditionalForm]], "Text",
  FontColor->GrayLevel[0]], "Text"],
 StyleBox["\nAnd P(x) is the probability density function of the underlying \
logarithmic asset price. ", "Text",
  FontColor->GrayLevel[0]]
}], "Title", "PluginEmbeddedContent"],

Cell[TextData[{
 StyleBox["Code", "Section"],
 StyleBox["\n", "Section",
  FontColor->GrayLevel[0]],
 StyleBox["For this, we use the mathematica function Ito Process to allow for \
the \[OpenCurlyDoubleQuote]randomness\[CloseCurlyDoubleQuote] that the Wiener \
process is.  This part is the \[OpenCurlyDoubleQuote]cW\
\[CloseCurlyDoubleQuote] equation we use.  The 2 differential equation\
\[CloseCurlyQuote]s are \[OpenCurlyDoubleQuote]solved\[CloseCurlyDoubleQuote] \
in the hestonmodel variable and then the output is generated by running ", 
  "Text",
  FontColor->GrayLevel[0]]
}], "Title", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"hestonmodel", " ", "=", " ", 
    RowBox[{"ItoProcess", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{"\[DifferentialD]", 
          RowBox[{"s", "[", "t", "]"}]}], "\[Equal]", 
         RowBox[{
          RowBox[{"\[Mu]", " ", 
           RowBox[{"s", "[", "t", "]"}], " ", 
           RowBox[{"\[DifferentialD]", "t"}]}], "+", 
          RowBox[{
           RowBox[{"Sqrt", "[", 
            RowBox[{"r", "[", "t", "]"}], "]"}], " ", 
           RowBox[{"s", "[", "t", "]"}], " ", 
           RowBox[{"\[DifferentialD]", 
            RowBox[{
             SubscriptBox["w", "s"], "[", "t", "]"}]}]}]}]}], ",", "\n", 
        RowBox[{
         RowBox[{"\[DifferentialD]", 
          RowBox[{"r", "[", "t", "]"}]}], "\[Equal]", 
         RowBox[{
          RowBox[{"\[Kappa]", " ", 
           RowBox[{"(", 
            RowBox[{"\[Theta]", "-", 
             RowBox[{"r", "[", "t", "]"}]}], ")"}], " ", 
           RowBox[{"\[DifferentialD]", "t"}]}], "+", 
          RowBox[{"\[Xi]", " ", 
           RowBox[{"Sqrt", "[", 
            RowBox[{"r", "[", "t", "]"}], "]"}], " ", 
           RowBox[{"\[DifferentialD]", 
            RowBox[{
             SubscriptBox["w", "\[Nu]"], "[", "t", "]"}]}]}]}]}]}], "}"}], 
      ",", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"s", "[", "t", "]"}], ",", 
        RowBox[{"r", "[", "t", "]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"s", ",", "r"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["s", "0"], ",", 
          SubscriptBox["r", "0"]}], "}"}]}], "}"}], ",", "t", ",", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         SubscriptBox["w", "s"], ",", 
         SubscriptBox["w", "\[Nu]"]}], "}"}], "\[Distributed]", 
       RowBox[{"cW", "[", "\[Rho]", "]"}]}]}], "]"}]}], ";"}], "\n"}], "\n", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"cW", "[", "\[Rho]_", "]"}], ":=", 
    RowBox[{"ItoProcess", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"0", ",", "0"}], "}"}], ",", 
        RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"w1", ",", "w2"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"0", ",", "0"}], "}"}]}], "}"}], ",", "t", ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"1", ",", "\[Rho]"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"\[Rho]", ",", "1"}], "}"}]}], "}"}]}], "]"}]}], ";"}], 
  "\n"}], "\n", 
 RowBox[{
  RowBox[{"output", "=", " ", 
   RowBox[{"RandomFunction", "[", "\n", 
    RowBox[{
     RowBox[{"hestonmodel", "/.", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\[Mu]", "\[Rule]", "0"}], ",", 
        RowBox[{"\[Kappa]", "\[Rule]", "2"}], ",", 
        RowBox[{"\[Theta]", "\[Rule]", "1"}], ",", 
        RowBox[{"\[Xi]", "\[Rule]", 
         RowBox[{"1", "/", "2"}]}], ",", 
        RowBox[{"\[Rho]", "\[Rule]", 
         RowBox[{
          RowBox[{"-", "1"}], "/", "3"}]}], ",", 
        RowBox[{
         SubscriptBox["s", "0"], "\[Rule]", "25"}], ",", 
        RowBox[{
         RowBox[{"Subscript", "[", 
          RowBox[{"r", ",", "0"}], "]"}], "\[Rule]", "1.25"}]}], "}"}]}], ",",
      "\n", 
     RowBox[{"{", 
      RowBox[{"0", ",", "1", ",", "0.005"}], "}"}], ",", "1", ",", 
     RowBox[{"Method", "\[Rule]", "\"\<StochasticRungeKutta\>\""}]}], "]"}]}],
   ";"}]}], "Code", "PluginEmbeddedContent"],

Cell["From here, we will plot what the random process looks like:", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", 
  RowBox[{"output", "[", 
   RowBox[{"\"\<PathStates\>\"", ",", "1"}], "]"}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1: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
vw==
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{24.428439453597072`, 0.844529204263132},
  Method->{},
  PlotRange->{{24.428439453597072`, 105.3751491070735}, {0.844529204263132, 
   1.3286155217529279`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{1.6189341930695287`, 1.6189341930695287`}, {
   0.009681726349795916, 0.009681726349795916}}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
This plot is a Wiener Process that we then project onto the data for a \
something such as an asset.  We do this by showing how the volatility \
fluctuates due to the change in price (here we act as if the x axis were are \
the price of the asset, it is not a time series) and the volatility is then \
taken from the y axis.  
  
  From here we can plot it as if it were a time series by not including the \
price since the heston model is more interested in understanding the \
underlying volatility of some asset.   You can follow the intial random \
process here see how it follows the previous plot but this plot is \
\[OpenCurlyDoubleQuote]time series\[CloseCurlyDoubleQuote] in nature.  \
\>", "Text", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"output", "[", 
    RowBox[{"\"\<PathComponent\>\"", ",", "2"}], "]"}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "\"\<volatility\>\""}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1: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
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0, 0.844529204263132},
  Method->{},
  PlotLabel->FormBox["\"volatility\"", TraditionalForm],
  PlotRange->{{0, 1.}, {0.844529204263132, 1.3286155217529279`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{0.02, 0.02}, {0.009681726349795916, 
   0.009681726349795916}}]], "Input", "PluginEmbeddedContent"],

Cell["\<\
Since we are not limited to plotting to 1 asset, or even one possible outcome \
of an asset below we will plot 5 and show how they vary amongst themselves.
  \
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"output", "=", " ", 
    RowBox[{"RandomFunction", "[", "\n", 
     RowBox[{
      RowBox[{"hestonmodel", "/.", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\[Mu]", "\[Rule]", "0"}], ",", 
         RowBox[{"\[Kappa]", "\[Rule]", "1"}], ",", 
         RowBox[{"\[Theta]", "\[Rule]", "1"}], ",", 
         RowBox[{"\[Xi]", "\[Rule]", 
          RowBox[{"1", "/", "2"}]}], ",", 
         RowBox[{"\[Rho]", "\[Rule]", 
          RowBox[{
           RowBox[{"-", "1"}], "/", "3"}]}], ",", 
         RowBox[{
          SubscriptBox["s", "0"], "\[Rule]", "25"}], ",", 
         RowBox[{
          RowBox[{"Subscript", "[", 
           RowBox[{"r", ",", "0"}], "]"}], "\[Rule]", "1.25"}]}], "}"}]}], 
      ",", "\n", 
      RowBox[{"{", 
       RowBox[{"0", ",", "1", ",", "0.005"}], "}"}], ",", "5", ",", 
      RowBox[{"Method", "\[Rule]", "\"\<StochasticRungeKutta\>\""}]}], 
     "]"}]}], ";"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"output", "[", 
    RowBox[{"\"\<PathComponent\>\"", ",", "2"}], "]"}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "\"\<volatility\>\""}]}], "]"}]}], "Input",\
 "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1: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
      "]]}, 
    {RGBColor[0.6, 0.24, 0.4428931686004542], LineBox[CompressedData["
1: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
t3gPNRxKBy9db8nfrzR4vsYj0DFChL8Ak5NjhQ==
      "]]}, 
    {RGBColor[0.6, 0.5470136627990908, 0.24], LineBox[CompressedData["
1:eJxV1Hk8lWkbB3CjRZ2Ut6J3lK0saW9SQyPzkxhTebPk7W20DJUWhRY1o5o3
jRY0RUVkKqPRaGMqR6QhESeFCKXsHOvZnfMc5+g0vZbr+eO9Px+f88F57vu+
ft/ruaZvCfby19bS0ioZ+Bn8/P+lwBH9dNeWwyEQRDkEBzWxv5/AGG4Khz+d
QbbJSYFn9jkk6FZyY2Yz9P9YLNr147bA/zBIvDy0MMV0U/y7lUr6/jVcsFFW
G2UrIfQc/EsyXggjRZkrlPR8CkIcMtpyfJTgvP19rwMnFR87vg4LjFXSfreQ
+sR/joFaiVkbowsY67vYqjDhWkxg90/HV1vslhS7K5Ey8PTb3+/BPGhS6CJv
9rz72MCX9tjUMbAZWhlIc22d5nGIPZ+Ll9aXLuWeZ1DIWA+ckImtf0xp8LVm
6D5ZaP2VOTH5JgOv4QNhK970Uf8UW+8jeC1a7cYvYNByeHDDHJQFWwmlmQzd
9y/MXaep2qqnxL7B6+3NRTmqkx6YsPfPw+6Dxa73riow7JAPh7OOqX2GDNWT
j++yeBnxGxT4duiApyipX/U0XaGg+p5i8s7R7+6I5Bg8beBI5LjkPrUvklO9
hchYfTSA6y7HUDlvC5Eb/u+28SPkVP8zWJzffCrFXw7TweuYFMFP/nINx09O
eRThTIkB//RJOXZsH1zFWLfpjvn6KAXlw8OjCD2HixoFBnfTT+fB6LcUs8qB
+w3n9RyKPUmxXXkMlIPbMc8Rz1P+YWnL5leCX1LHP/s6ksHXQxu+gF2gzkjT
EjbPF0gcHZ2eeU6BoeudfInpzh7juUfZfEshfcy5c32gX8tKhxaMI7umxsxj
KO8yvNItLo90YmAwdMFyHJ3z65/oVFD+5UgTfH87YDODoe02vsLNnr4w7ddK
8qjA4eoCG93JKqqnAmFXrc95xPaRTwWmJLyfa3q8j+qrwLnAgMidO1TkVYmY
eqNzT6r7qN5KeDVaHWuN6iO/SkQ8CdhXraei+l9j64SiB0ciVOT5GlU7Jd9f
ua6iPF5jqfRV9ro6FflWwTcryjCkVEX5VCFxn05zcqCavKswv/RLn+QCNeVV
Df/l8vmmdWryr0bYtMo4yzNqyq8aho8SeNo1KuqHGizhqzdsOqiiPGtw7H7j
bCN/FfVHDT6dTjQct0BF+b7B2mnypOXpauqXN/CLc509w7Sf8n4D96UpJ54t
6Kf+eYudD/c5HFnWT/m/RZDieaozr5/66S3+LAidWZjzgTxqsTTBLMR7m4Y8
atFu5u78/piGPGoRNM5Fz2zuR/KoxeLwUzN7734kj3fQLL/l29SmIY93KA2/
sLuhTEMe75BsEKx3OEBDHu+h4jm7XF6pQcyQx3uMsr9cHHH3A3m8xxHH8bI1
oR/Iow4/bq6eL/r5A3nUIW3m8do9HA151GHGHImdJrufPOqRtjeu6JpDP3nU
o1Ena2ndNtajHi+M9O85Tegnjwb8U9e/YnI569GAtUbeJ065sR4N4H72sO6+
BevRiN3hEsm8AZ9hj0YYO7ysWOStIo9G+NQ56bfUqsijCX//18//GVdFHk3Y
oZXXs/qIijya4KOyP1I40O/DHs0o893U6369j+pphkuSy8b6XX3k04zdTz+d
zFuiovqasSypb2puETuvm7Fjquf5VVZKqrcZY+w/XYvSZedFM2qMCmXiUwqq
vwV5OryLOd+x87AF2kzUmM2jFZRHC5SO6v0cWzn5tmBZaNrLkTx2nrWgnbHJ
OOgmJ+8WOMn9omMPyCivVvQdTKoN9pCRfysmzTke9fiejPJrxbjSolmNahm9
n634V2BxX1ynjPJsxfqI6G3aPr3UH63wjb/sPWKsnPJtQ62VdtqhhF7qlzbU
Bdy6YWTZS3m3If7e9YVjNDLqnzYYTm0/s92+l/Jvw+I3NoqCKzLqpzbs3MM/
oG0iIw8+4scmGP8UKCMPPi68bMjauFVKHnx0zPev++GZhDz40DWxqzr7REIe
fNhpLQt0Oy8mDz4a75aeZLKE5MEH91NaWMRMMXm04xXnH5Orp4vIox0Pdv8U
me4pJo92rLExjjS1lJBHOxqkMzj5E8Tk0Y5Rt3UMVuUIyaMd8Y5LMroeicij
A7ZaQXZzDwrJowMW1hq3xONC8uhA/jdWsy9whOTRAc/H6YWK2wLy6EC5x1rG
3UtAHh3gBo4xtBwpII9OOBVs8fjbREAenchblFfmNUpMHp34XFTwg7atkDw6
MfVWUjf3joA8OmHnclRfx19EHp3oqM3zVb8RkEcXTC7enzb7jog8uhD16gD3
iw4xeXQhJ3+iSe4UEXl0gZfWO/7VdRF5dCH6bPZ5g4Hzhj26kOr1s5Wxm4A8
ujDjUmu02S4BeXTDX+Ni8kxHSB7dOCxxem20XUge3ZjhwZGuzxOSRzdejPDP
CjJlPbqxuMktLTZWTB7d6LppvCIgTkwePbA94bwgZOD+wx49WGgvFQuWScij
B8IrqpHMCCnNyx60WaDW3FFCHj1YpFviZ/mbmDx6sGK5Z/C8SDF5CHA62TPs
vlREHgLU9M6W+Z8VkYcAi68cn+iezHoIEMxrnaWOEZGHAL9EyGaeLhWShwCr
rqY/7dsoIg8h6quzuV81sB5COE03+yZ5O+shxI0Xl2zFyayHEJmJ+q+/3M56
CHHzr8MdTuYi8hCCmfv5xUgB+34IsW5X8Ke7TiLyEKEh7oZbfT77fojQbBEc
6uguIg8RFh9aOzZzwH/YQwTf/clq2QjWQ4TOlVM+C65jPUQo2RD4RfoSKXmI
MTHPeCEnREIeYuTVu7qGW7LzSowJtub71/iyHmL08/d68Zaz80qM9nc3fGJq
ZeQx4ODsarPvjIw8JBhtUcG18WXnlQTfHuU8l5uz80oC5+jHpxNqpOQhgd6k
8NC7e2XkIYFOduBObz92XklQ4P3w9g5zdl5JEXmgWHBxnAz/A/0IVF0=
      "]]}, 
    {RGBColor[0.24, 0.6, 0.33692049419863584`], LineBox[CompressedData["
1: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
Ro1LDdP8H/jGQ0S77HXAsL48/gdsVGN7
      "]]}, 
    {RGBColor[0.24, 0.3531726744018182, 0.6], LineBox[CompressedData["
1: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
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0, 0.5245756648292784},
  Method->{},
  PlotLabel->FormBox["\"volatility\"", TraditionalForm],
  PlotRange->{{0, 1.}, {0.5245756648292784, 1.8547231239283066`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{0.02, 0.02}, {0.026602949181980567`, 
   0.026602949181980567`}}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
From here we can start to further understand the parameters, for instance, as \
\[Theta] tends to 0, the volatility tends 0 as well.  This intuitevly makes \
sense as the long run variance is 0, then an assets price would become more \
stable as future expected price would be within a much smaller predicted \
range.  
  
  \
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"output", "=", " ", 
    RowBox[{"RandomFunction", "[", "\n", 
     RowBox[{
      RowBox[{"hestonmodel", "/.", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\[Mu]", "\[Rule]", "0"}], ",", 
         RowBox[{"\[Kappa]", "\[Rule]", "1"}], ",", 
         RowBox[{"\[Theta]", "\[Rule]", "0"}], ",", 
         RowBox[{"\[Xi]", "\[Rule]", 
          RowBox[{"1", "/", "2"}]}], ",", 
         RowBox[{"\[Rho]", "\[Rule]", 
          RowBox[{
           RowBox[{"-", "1"}], "/", "3"}]}], ",", 
         RowBox[{
          SubscriptBox["s", "0"], "\[Rule]", "25"}], ",", 
         RowBox[{
          RowBox[{"Subscript", "[", 
           RowBox[{"r", ",", "0"}], "]"}], "\[Rule]", "1.25"}]}], "}"}]}], 
      ",", "\n", 
      RowBox[{"{", 
       RowBox[{"0", ",", "2", ",", "0.005"}], "}"}], ",", "5", ",", 
      RowBox[{"Method", "\[Rule]", "\"\<StochasticRungeKutta\>\""}]}], 
     "]"}]}], ";"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"output", "[", 
    RowBox[{"\"\<PathComponent\>\"", ",", "2"}], "]"}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "\"\<volatility\>\""}]}], "]"}]}], "Input",\
 "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1:eJxV2GdYU1nXBmBsWLAClhFFEccuOjbEUR/riI1mQUcYFcfC2FAYUVDsgwii
IhbE8ipilyK9CKEFQqhKl5IAIXRISEJJ+6Ks/PjOH65wyN57Pfc6ZWNgd9Lq
YF8NDY27fTQ0fvz8/4cIrrpBG7guTvjKHPnM6kYHfb6GycEDkhW/CRGtf73J
Mtobg7gP+h/6Q0jnfZH+Wdfl5RQhHvv9PNCjfDCy7br6759hn9VFfz9nAZot
f/zmBeKtV9eH1wvo+68gvcezPnJUgCHFAQ4rhrxBrFQ/1e69gMZ7h+0TAkec
KG/HTJvbyeIZHzFU2BRsdq+Nxg9C/CjR7LBdrXil+nZxQAi0JrMcnRnNNF8o
ktfytEKeNWPhzyMMEySHjVLqm2n+cARUem7brdGCFPEM1QwRmNH54igzvInW
E4VU272bj8Q1wap3Qnyc7nvWIqeJ1heDDIHZOMn5JnBdfgwYi7t5ifMOXm+g
9cbDZfivY84NbsSpH8tz+IIre/Srn/7XSOtPwKHBBfvZqvF6HRjwtLjqFxjb
SPUw4MU/7frcuxGmPydIQlV2Vo78bgPVl4THDqM+LVtbjx+zqaYEY+r1/aV3
GqjeFCS4xzlfetuAn+UUpyBc/vzIzYf1VH8qXCIrDPKf1mHSj+Xop6HomdTS
y6uO8kjDY/8BS64+5+HwoR8HE3Oyds2wH19L+aSj4s3Gs1vZtfgxmm5QOmL9
TayTTGoprwywi3OVd87XQfJjOHEGmq881M/U4VF+LPS9nWykNYuHlT8HzMSv
VhdWXxrLozwz8XDkJx4/sAY/l3edjcIS27fOvjWUbxZqHzRv+31oDbKzfh7I
DulO4Z6oobyzcdRezzjbowajfy4wB2uFw6t+0eJR/jl4G33tDSemGj+Hs8mF
nZ7++dUDqskjDwVfbnQvK+NSPXkYNjJKfqyASz55YB+O5w9141B9eegK3F20
/DSXvPLRpKyZF29dTfXmo8/CWzETZFzyy8fYCe8+ug+qofq/4pHeiamDA7nk
+RVtVltLh3hxKI+vGDrC4a//1XPI9xuer2XvUJpxKJ9vWPt6YVJtJoe8v0E6
O7u0e2ol5VUAduvZ5b7ZFeRfgL37fZ5fkZdTfgUY7eS+ardzOfVDISwKEt4t
OPed8izEfYn1y3t9K6g/CjEqZsSRNavLKd8iDF9yxkdSVk79UoTf/HOv5Pep
oryLsHVk06wnzCrqn2K0JuDb63tVlH8xJnn/ae4/jkP9VAzPg94WwzuryKME
j70tGwckV5FHCUQflpk4uVSRRwma047/u/12OXmUYMH40vcXBeXkUQqzSW8H
e4z9Th6lOFyxd0ebaxl5lMJ4/5/Wa96XkkcZEpRek/3fFeHOT48ydL25NmzT
0GLyKENoUESCkXkxeXzHbM+lNY23i8hD9TnUffrF5YXk8R1WUQfHCVU593qU
I9dy38CFc/PJoxwajgUzI3PyyKMcdz7ldIe45ZJHBRofrQ74yskjjwpstxz8
58eyPPKogO/i2ORmjWzyqMTVN7GhjBds8qhEVMnJgmxdFnlUYrlh2KBXqzPJ
owo6UesEJwSZ5FGFKd/XhEy4zCaPKpgGO5/TPJNFHhykNohPuznnUD0c3Nxf
aHetJod8OKj99kivYpq6Pg4KnUz3f9HJJS8OFmvrnO7fkkv1chBl80BrRnou
+XEw2eHCowV56vq50Fj5iW+Vl0eeXPjevNKQU5VPeXBR+mzmzD/355EvF1fH
jN29TjOb8uFijF4VU87LJG8uVnCMcm7MZVNe1cjoz9CTSzPIvxrX7Kb6Rl3K
oPyq0Wd7aTvLM4uuz2poLhtjqT09i/KshuuhZ9OcVfn3Lq8ae3UNjfMtcijf
GuxxH+jluD6b+qUGxSiIMHiWRXnXgBX8Vwn7jyzqnxrMWMf3s3zMovxrkD9K
q6DYP436qQYF0QPcCvYnk0ctFCx7A58VKeRRi09/cJds3pxOHrW42/BkwD6r
NPKoxZFyvn3p5zTyqIW2Z2Sxwd508lCNJ019vuBlGnnUYrV9ra54Tjp58FD4
xtL85JsM8uDBg2EkOmSUSR48mF4fpWe2jUUePAwH13+SPJ08eOh45BzvZ8Ak
Dx60cv6eb9OdRh51SArRGzZgLZM86rDG3HZtmHk6edThhHjRRJ+bTPKog8mt
cUJ3bXV/18H0dcuQs6r5ej3q0NfptOmJahZ58FHaszh8aGQGefARPVZ4oKCM
TR58BLCO/K4jzSQPPgYFTDk9oSKTPPhYun40L3ommzz4MHBvS0jeySaPetha
Pqts0c4kj3rwJ2hwy2Znkkc9lrrar3GYziaPeoj/bXOZ+JBNHvU4tsRkqMdt
NnnU49N5l376RSzyqMdzb2GpLYdFHg1ge5+9b9PDJI8G3Nbi3zF4kE4eDTBd
ETn9ykomeTTA+3xdYMAJtUcD1v56YfDccWqPBsy5v0NvdnEqeTRCucInbjNS
yaMRHzQ0LobMVXs0Yhdfdl8cn0H3y0Y0ZFXeXTA8nTwawXdclVVWnkoejaje
6H2pekMaeTRhziz2PO8LaeTRhOHiUquCmDTyaMLks/v61I1lkkcT2BOPafAW
MMmjCdM28jrSVed7PZqg91padHN9Bnk0Y3J8v4Xi10zyaMbRjPu3F1mmkUcz
Qpq4O69dZpJHM3aaGZ8T2mWQRzMYYlZP+SAWeTTD+3H++yeFmeTRjDh9Re5D
USZ5tIDvy/9s+ZRNHi1Yj7WldpPU10cL5m+UPPSamk4eLbi1Ybj9q2lp5NGC
R+fycn1MWOTRAvOY2eus5rPIoxUXHtmKRt1NJ49WCBuXHD3uwSSPVly8cLfu
8y0mebSiz3XTw5GMFPJoxe//Fe0xckgjj1ZMveFzxnJ4Cnm0oclqw1pFVwp5
tOHDlDs6u03UHm3o48Sa3mmaTh5tGHjn5VpX1fXW69GGhtigdd2SdPJow67t
DXlnhqifH+3wXDL1zsoW9fOqHW+8NjfFTc0mH9X573WXzVTPm9762mFRlGhk
pssmr3YY7eofZ/gyEz/LPdSO6+bGo7+dY5FfO6T/pISlprLp/tCO/D2+O5ze
Z5FnOxLi+CPm/ptJebRjvo5x37m/ZpBvO+JrzRbpC5iUTztYNSHrn6r6o9e7
HYucHV4NU71H9+YlgNmSJ6tcEpPIX4AxuZ7pjiIG5SdAkM36oE2xSdQPAkzo
Dpj2Z0US5SnAQgdnuIFB/SHAHs1r4u7pyZSvAGnLkhM1eUnULwK0K/N2/8Jm
UN4CHHTr2Cy5xKD+UY2/u2ZPyrBEyl+gGtex786/EqifBOBZfPLZ9ncCeQjh
cN6mdqAfgzyE2GXxpGzImgTyEMJXZ8or/sEv5CHEyRrDLn5QPHkIMUA209nL
J4H6T4iE9zZeWw7FkIfqvEVqll5cNHkI8WVh0A6pcwx5CJFxqMWaZRxNHkKk
6I65svRxFHkIMW5nqj23IZY8hNAut54UOyiOPITQ3HDpbr9dMeTRgdYp1o4n
pGHk0YGthuvzT7tHkUcHll+S6LDvxZJHBwY1Pu4MjY4mjw7sG7NmyofXCeTR
AZdjkmVOfRLJowPnPPf4my9Xe3Tg6SymtqMyhTw64NR3a2mRRyp5dOAXvcBt
/i5J5NEByQdz9yleDPLowMpjG0t+K1R7iJByO9l1y3S1hwicl8NnDe+MJQ8R
RrMMDU6WRpCHCN7/1Nnf7htNHiLs/D1iQsT2L+QhQnrgzC0Kmy/kIYLHxCmC
KHYCeYhwM8xor/wAgzxECJtUHrHtGYM8RKgtMd2VMySWPET4+0DJwK2qfur1
EKHhw7S8y9bx5CHCFkbADf/waPIQI39q0C2hUxR5iOG57UwH60o0eYixPcKs
+NbGSPIQw+rY3q4DRhHkIYZfaEbRLyUR5CFGmNso4xEbwslDjLObToVd1owi
DzEWsa5qsZRR5CHGnFRbnsaWWPIQo5+bz3G7F/HkIVbtN987LxkSTx5izExw
Zp7tF0ceEojPiY6b9osnDwka7fR2BA77Qh4SLDF3r/LOiiYPCQaec1UktkWS
hwQz7Mce7JkTRR4SrHyjmWy3JJY8JFiokJeYbYwlDwlkdisumlXGkYcEhXcG
Vr1ojSMPCd62vNwypjKaPCR4usLL97FvJHlI4NKsEKzjhpGHBNqXbR2/9o8g
j04UjzfIHv8hlDw6Ib8bq1BohJJHJ47tl+plngolj05EM8NfB4tCyKMTUZW2
qzfZfyaPTmxefKf5IfszeXRidOuDqHW3IsijExN9PpenW4aTRyfCazTrX3ZG
kIdq/Hv/XbsQGkYenRinqT9vhE0MeXTCLfXrDY9+UeTRBU/no9ziW+Hk0YU1
BfIL8XOCyKMLh1/ExGaNDyaPLozw/P7+ufgjeXTBZ6IwentdKHl0QfdLyP2i
eZHk0YUi/r/NqexIen52YeHX/UlBsgjy6EL8yBODIudFkEcXRq4OjRx7LZI8
usA9G2RsdS6aPLrQsvdqtdmNKPLowr1ig62GkyLJoxutzN0xCfdjyKMb/1U1
/3dAU32/6sasb9MsKjLDyaMbXo7LOdt2hZNHN55qjmk/bqa+Prqhzbau+RQf
Qh7dMDfp2GHvHEwe3fC7GWE94G0IeXRjuu+7zUdzPpNHN+yyPCJzWiPIoxu3
9m/c6zIumjy6cXMgN+qvoZHk0QOL12K9e4lqjx6UlvXY6HSEkUcPnI79ZXLL
9iN59OBkwgih7cZg8lB9PzNz9piAYPLoQd62y1tkvwWTRw84S9dVcQ6GkkcP
XK/pTjWfEkwePUh6/8lZw/gzefQgeeUio76zPpNHDzzGn1tV9r/P5NGDZl3m
ysJHIeTRg34j9HQ4Q0LJQwrZqMGTbbvU14cUJheFM/f5qa8PKTyYXVb1u9Qe
UiwQvOV0aaufH1L0BKdvOXIlljyk0NTf4GekHUceUhxKq1d4O0WThxSPB2W4
+/0TTx5SGAcbReyaG0ceUuQoGaOMWhPIQwr7xcvTEvPVzw8pFj7rbxc1Un2/
kmHyRqMxRfwE8pBBP2KGa9OxRPKQ4dT7uzPO5CWThwyvb+81OBmRTB4yvBro
dnB2fRp5yOD43TAreY/6/UqGpYrT+y6OyyQPGWY/MH6Z+JFFHjJkH/rHRXaK
SR4yrFA0prybnkYeMgwaJcg21U0hDxn2MXpO8d6lkocMUWEHJt1+qt4fyHGY
m6Jzz029/5Rj90HDZf1aUslDjhMfO9a9XZROHnL46J16UTZF/b4qB+PL4ZOT
nVLIQ46iQ0/7/VaXQh5y+L182WfP5RTykKPjzJp3ntbq57kciY8HMWTrUshD
jp3LKyobtdXPczl+d++/O9I/mTzk+FfTxeTNFfX+XAHXRceymlXv470eCviM
mJhbyUgjDwUWfhJtijNMIw8FZo76GuxgmEIeCux2DXQYckbtocD8iso3vCb1
fl6B7fLZWtEn1O/7Cmy02nTDTvW510MBjWCIdgRkkIcCfavSErTOqj0UWG4u
Cvyep94PKHDcyWRSRYt6/69AjUlz1DKZ2kOJ5IAR8i131B5KzC9xY5V8Ve+n
lVAWWZ9+Yqb+/4ASkW3bx2kZZpCHEp5/37/5UcwkDyVcTvo4KR3V+zslWr5d
qfjVIIM8lPhaGPSP0kb9/xAlKv3KPcwXs8lDNf/0eT1XV7DIQwnXfoHRB33V
+yclUK8Itviu3p9rrHIffVbsrZeL/wMqmJuZ
      "]]}, 
    {RGBColor[0.6, 0.24, 0.4428931686004542], LineBox[CompressedData["
1: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
8tiv+OShR26AQBPH55OHHk5/Thm4vJ5HHnpMPqR3teXxyEMPB7tFqSF/8sij
4zn4qtbacgaPPPSYauab+ocJnzz0cJ036sDppXzy0KP3sOOHfML55NHxnHxl
RVyrgU8eeoT2KWZLbgjIQ48T69KMF09g7r/10D2efP3IMiF51GHBssFe8Z5C
8qiDteko204CAXnUIcxx8ytOPZ886mDeKW36hjuMRx2W30z/da2WRx51MO6m
ivTJrCaPOmzMfvH3NWcuedSh7GHq/TM/ccmjDncio/6NfMwljzqUc77MGXKW
Sx51iL3hfH6dEZc86mD6cphzqXM1edQjIqrn6VePuORRjzUx4/eXra0ij3r4
+VvF3a+sJI96/Oo/pbNudiV51IO9SNldzq4ij3pM/WV90zpzLnnUo3DyXx/9
Yrnk0fF9cdh2j5uV5FGPw4/22v29tJI86rGtf+7QO2/Y5FGPawufrL03toI8
6mHdq9TSqTubPOqxOnrV9qy3HPJowMWNb5+6BHDIowFtfWZevZvOIY8G3Io9
Y3WgbxV5NOBCl5hrKTO55NGAXnaDHA6CSx4NGL/pWZwusIo8GvD1gKPxqx4c
8mjApgnT/xEWccijAS//LDP8z7eCPBoQ8NMQy1m8MvJogJt/y6febuXk0YBJ
2wOOVpysII9G/BdRauecwiaPRuwJLbPLG8Mhj0bsUiYOji1jk0cjfrVakRaY
WEEejUh6JH9/o18FeTTi7Sobi6hANnk04pBj33yOvIL2z0ZcKjI7WrSmnDwa
oag/nrVwbzl5NOLmEZOpgQnl5NGI4aIto1e7sMmjEc/Dw3y3bWE8GnFv09PZ
L+IryaMJ45YXRXZ9WEkeTRi70drhWPdq8mjCcPYwsa17NXk0odopP2qtrpo8
mnCy51jTbEkVeTQh/pI6OrCCSx5NWFl2/jJrZBV5NCHwRPDYrUWV5NGEa5aF
bkJnDnk0wVlyPdHPspI8mvBiiCzAEF5JHk0Yv5G1fpg3mzyaYQhX+nqfZzya
0cc80yXbpoI8miEftDyNwy4jj2bsdF2749S5cvJoRuNG0ytJChZ5NGPTiWlj
DKtZ5NEMMztv96h15eTRjNjeywYs68Z4NGOlE0cVZsd4NGP6RgPn04My8miG
f7/bE+pYJeTRjEuyi3FrvUrJoxlnj2Vkln9kkUcLPoYEnlMGs8ijBfacvDAf
UQl5tKCc5SDY+rSEPFoQz11+N2BzCXm0IKqk9Osfj4vJowVvrwf3CMkpIY8W
THYtaP3pfgl5tGDSqqFvc3cWk0cLVozq667dX0QeLfDt3/sBT1pIHi1Y5D5q
+M1/i8ijBTznJTaLfQvJoxX1p87EV2cWkkcrXDKa3Gw6F5FHK9y3JPwsPVVM
Hq1gjewit+hVQh6tECeVTLo0t4g8WhEyt81m8fpi8mhF4WHzpaY9S8mjFdvY
VsOP+5aQRyssds+K+uNFMXm0wt5+UoQssoQ8WjFgxtRkz+el5NGK6fZlR1ea
lpFHK2w8p+wonlZGHm0o2X7W37pTKXm0IWGVzUdLJYs82hD/7vIAL/cK8mhD
5gftuGHvKsijDY7xj8c847HJow0xfR8+6LeWTR5tUCnb5DnzmX7VhmpNj8T0
RUy/agOXf2wM+0IlebTBc49260Z3Dnm0YYL+UPnSVRzyaEPhrD2ex4w55NGO
F/mDM7bpOOTRjsMB0U6zVjP9qh2z/Va9Pj6b6VftuFNxJn3PCGb/aMerXPmH
HItK8miHrSDEPjm2gjzaMVByOjj1Goc82lG7feDVk4fY5NExn2PkxOW+bPJo
B48/5pRvUBV5dIxfdbRs+aMq8miH14WVphPPcMmjHR8mZXt249aQhwEfauR/
uZTwyMOAIxeDO48255OHAWGr3hUEXhWQhwErM1rcre8x+7kBO84+37MtUkAe
BuwUl5w+uFRAHga8aBlR7D2NeZ9jQPLrUqdPfYTkYcDCg71iPrYw73cMEHw8
f5Hbj3nfZujYz2U3XITM+x4DSjvXB4o2icjD6De7Ox7b/ikQ4v8AY8i7XA==

      "]]}, 
    {RGBColor[0.6, 0.5470136627990908, 0.24], LineBox[CompressedData["
1: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
ZXIUGnPJQ2L9RNG43S7lufg/U6iW2g==
      "]]}, 
    {RGBColor[0.24, 0.6, 0.33692049419863584`], LineBox[CompressedData["
1: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
      "]]}, 
    {RGBColor[0.24, 0.3531726744018182, 0.6], LineBox[CompressedData["
1:eJxV13k81Nv/B3BXpeW2uW0ulereLHVTchVaXm7d244b3/a43xJSKkopbSgV
WlTa61cq7VEYBoMZE7JUjGVmLGXsu9kZ61fue/74ff7xGDNzznm/nu9zPp+Z
vvOAvYumhobG1R80NL7//f+XHMfHR64U+XpjEsN8ydEzMnp9Fl98ny6fxJOB
OTWwaT3zMoyFrTdmbVZ/PgwZfqxpo/+W4+6dgQtzLpqOs1mjoM//HxbZWYx/
mK9A8/rv/wnHFNfdPy59rqDvP8X1EnOfif2vR/CfeC4Z8RzJPpu0bD4oaLyX
CNa55LZTUwnj7VfSFEZvYDPK37bhoXr8SGh99Bhy6poCT/u/zX/yDlqeC6NC
09XzvceGGXpzXyYpYDZwxWCwrPX8xVFKmj8WbmNcr7YVKsBVGPXPwMCUxPE3
W++q1xOPOe37bKcPVcL+3wnxT+75rHKhktaXgBvyMqGYo4TI9/uAiTh9athb
5Q71elmo8hLoG15Swuv78jyT8fTjGkltpJLWn4L7dn6JWhcV+NeBjVKLJxp/
xKnrYUNle9Rll4ECqwYm4ID762xtXrGc6uPA7DknXN9ege+z9U+JJ4JH+1X+
cqqXiy87IhYsqpdhoBw+F+ULRzy4ZSil+j/gnEfXhqhgMfS/L2dqOnKXtqWz
9CWURzqm+vhaFkRI4Ob6/cpAd6BL2rGDUsonE7v0zu7dz5Li+2jjIzOxWTxC
EBQipbw+YlSo6R2bFCmU34dTfMS0uLeOQ4ZKKb8sGGx0f5b/SIKlAwNm47HB
2DVXHkgoz2wYRRrHHmmVYGB5gTlI2q/18nOChPLNxcJDuzaW9kjwKXfgwga+
OcxnSinvT2g0TrLvuyPFhIEFfkaqYd/+JTZSyv8zHK12pYTvkmJguO1fEBJw
e+ukvVLyyEPGyXmu8+bLqJ48WHGf1Z0MkJJPHrr2W5+4kaeuLw+TC26M89SV
klc+4saF7p2XLaZ68zHWvjpJ/0sb+eXD9n1rSKNzK9XPw8stvzDS1zWTJw8+
tfrT3lU2UR48HCjbsUHl30S+BXi92z/1eE0T5VOA/5w4m7zlYhN5F0C58npo
s18z5VWIC8KxZRNjWsi/EBZ5lTdMdFoov0IkDYsaybvSRP1QhKp7pk1Ku0bK
swgvcw/4GL5tpP4owrLzXlZvWhoo32Lw5Y6Dh7ObqF+K4WQTLlq7qYHyLkbA
20qN6eJG6h8+vJvrzdbeaqL8+cgSvYixtWmkfuJj2i/vFCY/N5KHADevTDse
caaBPAQwUM6x/+t+PXkIsPTmOYPB1XXkIcDIiDVMx4Z68hDip3uFc2Iu1JGH
EKOvGrl82lBLHkJMTFnurDWzhjxK4Okz1LTdqRqhAx4luN0WMlfXt5Y8SjBd
PvXFMUENeZTiU76VxeBLNeRRCvcYkfOQx9XkUYruqR9/yjaqJo8ySI2q9P1G
VpFHGaLFu3QPaVSSRxl+Lh9/a++IKvIoBydQe3RjQRV5lCN6rHuGYbuIPMqR
6ZohcwsSkcdXuK3iLFy/r4I8viLCakSR3PEbeXwFz9x9iZ/jV/L4hjXc+qSw
+1/J4xuuW+qeWBb9jTy+YXG+WVB3Tzl5VCB62F3JiKPlVE8FRlQv156SXkI+
FfhbGpfrohJSfRVwsJjqfPU2n7wqkHFmm67xfT7VWwHXIZpmHEYR+VVg74xz
aZqfC6l+ERijp59/vaKIPEVwxO/7PwUXUh4i1B/S9x1qXUi+IpTUqNpOywop
HxF07tQc1WHzyFsE/rl53kcsCyivSixLYQ03+L2A/Cvx5x2HsQuyCim/SlzY
rLqnca2Q9mclOlJ/c9h6q4DyrEShNuw8cwqoPyrR1TfMzXNMEeVbhSn1u7Yz
mYXUL1XgOb+OZL4rpLyr4HnkkO/hy3zqnyocjvDuSPEVUP5VWFQU/czUU0j9
VAXDulnDeD8LyaMaDx3GvZ+0Skge1chhpLBtJqs9qvE4VGn+bo/aoxqN3hKP
U5eF5FGNwtG9l68vV3tUI3OID985TO1RjT1GzY9LpvPJowb2f4/pOGUuJI8a
uDYysyM0heRRg7bHGduUkwTkUQNP/erKlMMl5FGDskLHLcOCS8ijBgnP2Qsm
BQrJoxZzw8t6V3kIyaMWZSXrXUIWCMijFiEs/onLvXzyqAVr759ro00E5FGL
ZZ7rss/vLCaPWuzT9gm7sZNPHnX4alT1i2SogDzqEGKdJDiTySePOqgK/d2S
fheSRx00Nus65r4Ukkcdatqzf9Wu45NHHZ6n1TmbbOWTRz1Cjb/NY64uIo96
nLt1f6bT0QLyqMegNctLC/bzyKMea3TfLfVOzSePeuzZWWrtXpVHHvW4cMV6
6btzPPKoh3Nfifmn6er90QBWodlFnVIeeTTgdrMgMv5cAXk0wDZredz6wQXk
0QDnZ+uCj2jwyKMBUW96412P5pNHA1x45fobZ/LIoxGCZa1fTQx55NEIee2D
A1zxF/JoRO1+aZtXZz6dl/3n/DGftZmX8sijEXWP/Ze89PlCHo2QrHdpH/n2
M3k0wS7Zf5mtYT55NGHuj14dZX155NEE09X514tH88ijCfVBJ/7xm8cjjybY
r7LdeNe2gDya4BdubzV3bQF5NONUld1rzfpC8mhGuZYfZ0hbEXk0o+21jsxs
RTF5NGNbseSP4ZsF5NGMifef85bPKiGPZtgoLntxwwTk0Qyuxa9BXSgmjxbM
13Dkc64XkkcLZOErH835rD6vWiA6dWuGbXoxebTgoevqz75bismjBYoPKztd
HATk0YIZ9yy4Ufbq/dEKM/GUtdVmJeTRipsRptL3o0rIoxWv1xke8dYTkkcr
Nq2zlKax1fujFSy3y3+L1gnJoxXGDMPRNbkC8miD86trgXsVfPJog/dNhbVZ
kXp/tEHnlua3RYbq86oN4dnzh90IVZ9XbTD+y0I5iyEgj/7376SZB8wrJg8x
WEzHfG/TYqpHDN6tlc6pM9U+YsS6mPLu9Xv9W58YFqGHg//g8shLDMHXxuWp
GQUYKNdVjCM9Vro51YXkJ0bC5BvVYv8COh/E+HzdehzLkkeeYsSUR3XM+4VH
eYgxSxhg5z/hM/mKwTRmSDJqcikfMdJmX3vxz6oc8hZjSLOK8aj/ufXfvCQ4
UepwZtblTPKXYMfTYzf3LM6i/CRYrj2xKcI/i/pBgj/fBqxKsPlIeUrg5Dss
wj0xi/pDgoezV4t6Ej5SvhI05E7a/iAwm/pFgg0VicZyrSzKW4LyIXqV2rdz
qH8kuLx1/qugvRmUvwQeko9+uhPSqJ8kCDhoaq2hxSEPKSqulpUv5HHIQwrv
TVsO6wSzyUOKU0s0tCZ+TSMPKbhvboTrTUojDykW5F+MTFjNpf6TYse6B01R
Xz6QhxTSIUVrowK55CHF2KqwJzscuOQhxaMjXZtcPLnkIYVo6yC7Vz+lk4cU
mscWy0obP5CHFB7vMwZ5x3PJQ4rSwBcva75xyUOGMX6sruDQD+Qhw5u5jGsP
q7jkIUNNTVtYiR2XPGQw4t/zl5ZyyUMGlz7RhbIcLnnIkH7EUVuol0YeMmwP
u8K0fZFKHjKYt9w5U7qNTR4yRBk2//5In00eMoysix03dguHPGSQZe55tVIn
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
3+//B7iBocs=
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  Method->{},
  PlotLabel->FormBox["\"volatility\"", TraditionalForm],
  PlotRange->{{0, 2.}, {0, 1.4281900284084015`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{0.04, 0.04}, {0.02856380056816803, 
   0.02856380056816803}}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"output", "[", 
    RowBox[{"\"\<PathComponent\>\"", ",", "1"}], "]"}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "\"\<Price of the asset\>\""}]}], 
  "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1:eJxV2Hlczdn/B/DE0JSxj2UiZMsyjYlUSq/b3e9tsSVbKC1KiAjZCsUQsmUs
TcKMZUpN1JBEair7Eu3a973b7bbcuvUN7/N7PH6ffzw+fdzP55z387zP+5wz
cb3nEhd1NTW1M33U1L78+/8vE87eEZGi4j074Pivw42gGUZ07w/3yB/uai40
4TzUCahd/PAUhmknvzEfY0zPz6OH568DYyPO5UtfL7y/v6zPmxoD+v+h+NAg
S/l3+VxO3eIvf7kGg7wZHuaJ7P1/Yttd5ar52UYczawbWxdo3kLa/m2Ts9uM
6X138EDzw17zcSac6fZBSQq9CPgFnZ9ppW5M74/EhH+vBg1oMOL82fvrrBv/
YIxZasK2xfPpe9HYoMxfeXCmMWfO1+s+hm3c9OqULetvDOpXefmX9fYnWaHX
+4VYzFDXOjtcMp/a8wD3N1vouFeZcpZ8+yDMB7ZONnA2pfbFwc6p6sa78vmc
4j1fXvgIl67426cam1F7H0NuIzhdu8SUs+1L87Ym4Ck3KuB5iCm1/wmCW3yf
Lu8x4XxzSISjy1HXR/+YUX8SMfqC/gZjNw5H/PUDz7CTv2KlW9cC6t8z9Dsx
t6nSGpwvX+v9JGo725PCjy2g/iZDb2XWbtttCzhfu5OVjE+VpX46oebU///w
fJFPvlbqAs74L83RScGaAcGhgX3nUzxSEBvupSEvN+VscP1ypWLaEZvEPkNN
KT5p8I3eNCO+yZTz5W0jItNg3202wL/3+9/i9RyLTS79NsXFjNP65XWK5zDd
LXWMDzOj+L2AK3dV8aA6c4751xe+xEwZJ87cgEPxfIllDX0LjHw4nK/NC3gF
jfZnZilbORTf19B8dy/jgI0F583rrxd2ztONvuRlQfF+g8fHTh57EWPB+fFr
A99iblFToIJjQfF/i4qjb0v6V1twvr7O/h1+uT1pYFgNhzzeQ+ddGsfyLof6
8x6iMS2P0h5wyec9tvkHzR6+l0f9ew/TulnDfj3FI68P2OLzYu0SBy719wOk
99X132fwyO8DgtW0gkI9edT/dOQGz5twYCqfPNPRz2Od4s5uHsUjHcFV0w9L
VgjI9yMyR/4SoZgtpPh8RHWaE++gp4C8P+KOaL/9FZ6A4vUJc7hXP4YGC8j/
E4Jr+Bse/yii+H2CSrZi7dJbAhoPGRjWsPby8HlCimcG7Ic8WaP3s5DGRwZ8
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

      "]]}, 
    {RGBColor[0.6, 0.24, 0.4428931686004542], LineBox[CompressedData["
1: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
NeJ/2oHy3Q==
      "]]}, 
    {RGBColor[0.6, 0.5470136627990908, 0.24], LineBox[CompressedData["
1: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
      "]]}, 
    {RGBColor[0.24, 0.6, 0.33692049419863584`], LineBox[CompressedData["
1:eJxV13k8lOv7B3CVFrRwUKqTZWRrs5ay9BmiRCit34qTTicViVJJC0frqWRJ
C9rraHNUVBQlpE2iJCr7MmPGYGbMjN38ZC5//O5/vMzzPPd9X5/3dc+is3GH
x19D5eTkoofIyf36+//HPOZ+teRFNSFBqNjyUzHD24r+P4INOt5yK77PY6Zr
Hm1aln4GrotmyNU8sKHrsYA4ybK3gMmMjxsYiLidw7B/t4Duv4K6Y/PLZmTZ
M3nLfr1yHf6e2xIs0uzp+VvoeNOe/jXNjqlYejPAVvE2Zpqkq4s07Wi+u2Ae
eMFZYGTPNFofmSM2TMIdndBJIf8Mzp+MkutPRnc1OjJv9T9devMhcs4ZFCcO
WUjrPYJaju03/r3FTPOBkYqPjwOrtcY70/qPMW2M584N5ouZuWLD/hWegLl9
2an4yoW0nzTsrXXnZK9bxPSQLYjw5vM/T0Uvpv09Q+qUb4zP312YNSG/JnyO
EVE/4lMyFtN+M7HT88vhx6tdmIG/thfwApOLVX3+DXah/b9E9uSDSlY5LkyZ
wyuMueDOqUp3p3peYW9X7ZTsFnem08AC2WAodx2anu9O9WVDI2a4+XtjF+av
1fqXRIjjltKxa12p3lx825hWxPNzYw6UU5qLoNZPY7a+cqX6X6Po8Naltmku
TK1f29HMA7M4WfjgdzfKIw/h18xGF5U4M302/xpvoBBbdd5/+BLK5y0u6weE
dBcsYf6aTS35LQIYl5xcJrtSXu8wJUXj6d15zkzJr+nE7xBRVVu+Mc6V8nuP
Qr1LGoVuzsz5AxN+gPh0ROCw/vxleX7AJ+7wb1nbnZgD2zuaj4R7kUUOnoP5
fkSuvHvbvkdOzIKPAwOt5/5JHnl2MeVdgNKpq9v9op2Y6gMb/ITLc3SXRwud
Kf9PUGak3xP/WMQcmG59IcQV6lWOxx3Iowh/9PkuWx/rQPUUYeKjb22R/ziQ
TxFUNJ8vyXriQPUVIfWMaqTvlIXk9Rkfw6uSBF8cqd7PWNXUetnylSP5fUZG
wsihPRYLqf4viL+xzCjv5CLy/ILQ20OCV6Y7UB5fkHXwnZffe3vyLcbafKtE
COwpn2KkJ7ZkzYi3I+9ixB1JuXbb0I7y+gpLt+cX6w4xyf8rziz2jVt5347y
+4rD30vXbXphS/1QgrVPWP6pC0B5luDhvomrtrvPp/4owZrM2Ce2p6wp32+w
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
Po34P9SjEZI=
      "]]}, 
    {RGBColor[0.24, 0.3531726744018182, 0.6], LineBox[CompressedData["
1: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
NXN/9OHLB//ut80u5CHHOjMvsSZJ34X1fyeGy/k=
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  Method->{},
  PlotLabel->FormBox["\"Price of the asset\"", TraditionalForm],
  PlotRange->{{0, 2.}, {0, 105.13331663103222`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{0.04, 0.04}, {2.1026663326206445`, 
   2.1026663326206445`}}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
This follows for any number, as \[Theta] tends to some \[Alpha] in the long \
run the volatility will reach this level and the only volatility will be due \
to the random process, not long run expectations of an assets variance.  \
Example, if the long run volatility was 10.

\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"output", "=", " ", 
    RowBox[{"RandomFunction", "[", "\n", 
     RowBox[{
      RowBox[{"hestonmodel", "/.", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\[Mu]", "\[Rule]", "0"}], ",", 
         RowBox[{"\[Kappa]", "\[Rule]", "1"}], ",", 
         RowBox[{"\[Theta]", "\[Rule]", "10"}], ",", 
         RowBox[{"\[Xi]", "\[Rule]", 
          RowBox[{"1", "/", "2"}]}], ",", 
         RowBox[{"\[Rho]", "\[Rule]", 
          RowBox[{
           RowBox[{"-", "1"}], "/", "3"}]}], ",", 
         RowBox[{
          SubscriptBox["s", "0"], "\[Rule]", "25"}], ",", 
         RowBox[{
          RowBox[{"Subscript", "[", 
           RowBox[{"r", ",", "0"}], "]"}], "\[Rule]", "1.25"}]}], "}"}]}], 
      ",", "\n", 
      RowBox[{"{", 
       RowBox[{"0", ",", "3", ",", "0.005"}], "}"}], ",", "5", ",", 
      RowBox[{"Method", "\[Rule]", "\"\<StochasticRungeKutta\>\""}]}], 
     "]"}]}], ";"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"output", "[", 
    RowBox[{"\"\<PathComponent\>\"", ",", "2"}], "]"}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "\"\<volatility\>\""}]}], "]"}]}], "Input",\
 "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1:eJxV2XlczN0XB/DZpyIq7etMsyH7kojOTShZImtIyJ4WOyFJhXqsZffYlxQp
4kkiIlkKaScq7dqb9vU3dO4fv/mD19c093vP533OnW8vwlWejmtYDAbDSfHH
n7///9UIezQjbQu9t8G2+uvJazWa8NofWgz2kK11zRBrHFA5N/YYwIxBodfl
zfh+KHRHPH/z8EIrXDj/9wU7DnDL7+5oxZ+/DE4rGfdGF7RB1dw//3INfnoW
jrpzogM/fxNeHJzIV/vaCSrZN7wmqdyBgcnW2/s7d+N6d0FuFuzLmc8gg5Yd
T2waeA/mnjziV8Fgkt71I8H7hpBbkcgkNxWfzr4RBUv1+h17rsIivfeLhmSn
5BH6Y1hk9N/XI9g44NVmZ2UW6b1/DOTxt2qPecAir5sGKu7wGMK2GDpV89mk
dz//gfqe4wMej+MQx94bwpKHJUmvj3JI7/6eQmfGx3Cvj2xS6P1nwTgwKQ93
8PzAxv3GQ9SGwxNODOeQzX+25/UcxJUtLSsWcXD/L+BxafzXuWoc0uvwEjRU
u048b+BgPS9hzZfND+LrOMTu7w1ewcdzqdJIdy7W9wqiePuX7s/kkj93U9wS
/DcXjdnhxcN6X8Pm/jmfD6vwyd9ysl9D9My3K7XFfKz/DVTkqfJ91vGJyZ/t
GCeB1cvTwRY3+ZhHEjT8881NaZESWbf2z+stDJLsz/cdp4T5JEO7XEecOUuJ
/FlNMzIZgtamjHBNU8K83kGnZfKCAfbKpPnPck3vwNHw4iIrvgrm9x4Mf12f
eSxBhVj9XfADdG88W9LK74N5foDxw7Js5mWpkL/bC/gIwpDJki9H+mC+KTCx
w/KC/+i+JDXl7wusl4czIaEv5p0KTvtad7g+ViVafzf4CfZ9jdSa2aqK+X8C
26wgvrJBP/J3uWWfwfjoLZ/8lf3Q4wusnRb78EtAP6znC6yf/Slq15N+6PMF
Rj6aa9Z3dH+s7wu89WFPtPnWD73SICgtpL7maj+sNw0adfyLkgb2R780ODry
S5qc3x/r/wr6RRMXu5zvh55fwf32pfztWv0xj6/wcmF82b+7+qNvOoyYcjJ7
Slh/zCcdRE8O9BlX0R+902G5R/LV43w1zCsDTozaCIOnq6F/Bnza2xE3OEQN
88uAIutF4nVP1bAfMmH9mJVRT1LVMM9MuLkxpcO6RQ37IxPsORy/yAHqmG8W
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
CJJRDz5x746XZyymHkokM1I12DNHSv4Hs46fNg==
      "]]}, 
    {RGBColor[0.6, 0.24, 0.4428931686004542], LineBox[CompressedData["
1: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
m6w2C2+om6JHH7Lbw3BomOJ8+z+zEaxO
      "]]}, 
    {RGBColor[0.6, 0.5470136627990908, 0.24], LineBox[CompressedData["
1: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
VmWFiVL06EfC2bvaDRql5H8A3xmmug==
      "]]}, 
    {RGBColor[0.24, 0.6, 0.33692049419863584`], LineBox[CompressedData["
1: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
a+l7Z5OK/B/KHZVZ
      "]]}, 
    {RGBColor[0.24, 0.3531726744018182, 0.6], LineBox[CompressedData["
1:eJxV13lczOsXB/DZh5L2bdpmaqZClghZz4NbIVGuNftSSVK2q7KGZK1rF1ok
WUrklj23ZIkrJctQoVX7XtPe/IY5zx+/+aNeX/Od5/uc834+ZyJa7TfXg8Vg
MBYrfvz6/f+vVtihk+RUHLQVltrEuE6/Rq8PQPQ6uWNicCs8MA2pcXsQBqpW
72ucD9P3T4OKVlfQ0OY2uBDx+wU73PuX3NnWhvdHQcbHN6csmTKodfv1L5fB
3W4I0+NCG34+DjZMity6WrUdVKRX/CepXAP1uaEz+le143o34NGw2pkh89ph
0NLwZ23WiTDwS/L+wq/tuH4SNP6w+/lydgfEKT4tvXIHzLcs8fOMa8fnJcOX
T5wtTh9kMOr36x/47hSWVRXVjs9PgYa241UFvu2Q2WateEIqBMgIt3VZB+7n
PmjGhX/XXdgBc5UPhMZtM+6/9OnC/T2Et/GZecYdXVAc9GvBR+Dg3eSRcKsL
9/sEnM+69M1164ZNv7bnnwaXHnNvNi7pxv0/hfMk+s/Iib2gdEiHGpebxazg
PqwnHWJyPUWClj6Y/vsBGfDBdafVurN9WF8GRHgZX2czGeTX0xSPhHtlyypS
vORYbyaojZfuqfdikN/lSDNBt6bfuEHbGERZ/3PImONx+I6MQcx+bcf0BRwP
WHo/spZJlP14AclJtYUV6Szi5fnr9RIGFiU/5uizibI/r2DX84yFvO1s8ms1
naRXMED6lmkq4RBlv7IgNKfq9vd1HCL7tVxbFrhvPb9xylsOUfbvNdwSlGyr
YHLI5N8LvoFB3Oc3iuvZRNnPN5AQGOZlxeeQ39sL+Q+WjU6yv57GIcr+voXW
ZZtVcl5ySPbb3y9IdT56ZvdDDlH2OxvmqBxKS93JJbq/N/gO2k7U/j1+L5co
+/8Okh6MlZ/8xiW/l1uaAy/8Nuqw9/KI0iMXfkTqaW4u5WI9uXD9Y/Yx70wu
Ufrkwi2X9fVJY3hYXy7c83xbOPwFlyi93sM0uTxAazsX630P1z4Fmbj7cYnS
7z2sSGZ73pBzsf48KF13xGXHIh565kHRwGMZ3mE87EceHOlaMF9Fn0+Uvh/A
xXNJ7d+P+NifD+Dvc8jmVCsfvT9AofOf1yKe8bFfH8FJW8WqoJuP/h/BJaXL
rGJQf+zfR/j84eCxH8EqeB4+wcv/XF7mslSxn5/gyLi/pNf/VMXz8QkW9eia
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
hqgY
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  Method->{},
  PlotLabel->FormBox["\"volatility\"", TraditionalForm],
  PlotRange->{{0, 3.}, {0, 12.07458626333932}},
  PlotRangeClipping->True,
  PlotRangePadding->{{0.06, 0.06}, {0.24149172526678642`, 
   0.24149172526678642`}}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\

Another interesting aspect to note is how \[Xi], the volatility of the \
volatility, controls the amount of \"randomness\" that the volatility will \
have.  For instance when \[Xi] tends to 0, the volatility  will become \
\"stable\" at the level of lon term volatility.  This makes sense from the \
eqatuations as the process evolves the WeinerProcess will dhave less and less \
of an effect.\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"output", "=", " ", 
     RowBox[{"RandomFunction", "[", "\n", 
      RowBox[{
       RowBox[{"hestonmodel", "/.", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\[Mu]", "\[Rule]", "0"}], ",", 
          RowBox[{"\[Kappa]", "\[Rule]", "1"}], ",", 
          RowBox[{"\[Theta]", "\[Rule]", "1"}], ",", 
          RowBox[{"\[Xi]", "\[Rule]", ".01"}], ",", 
          RowBox[{"\[Rho]", "\[Rule]", 
           RowBox[{
            RowBox[{"-", "1"}], "/", "3"}]}], ",", 
          RowBox[{
           SubscriptBox["s", "0"], "\[Rule]", "25"}], ",", 
          RowBox[{
           RowBox[{"Subscript", "[", 
            RowBox[{"r", ",", "0"}], "]"}], "\[Rule]", "1.25"}]}], "}"}]}], 
       ",", "\n", 
       RowBox[{"{", 
        RowBox[{"0", ",", "5", ",", "0.005"}], "}"}], ",", "5", ",", 
       RowBox[{"Method", "\[Rule]", "\"\<StochasticRungeKutta\>\""}]}], 
      "]"}]}], ";"}], "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{"ListLinePlot", "[", 
    RowBox[{
     RowBox[{"output", "[", 
      RowBox[{"\"\<PathComponent\>\"", ",", "2"}], "]"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", "\"\<volatility\>\""}]}], 
    "]"}]}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1: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
      "]]}, 
    {RGBColor[0.6, 0.24, 0.4428931686004542], LineBox[CompressedData["
1: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
407foXwMwCM7tq1O+acR/geCZ7zs
      "]]}, 
    {RGBColor[0.6, 0.5470136627990908, 0.24], LineBox[CompressedData["
1:eJxV2nk8VH37wHHrGDNjViLZEiFLlgotrqu0F620F4ksLaJV7hZaVJI8Iu2F
VkkrEmlVKbRHi2QrKmPssvymzOX1+vnnfp2bOed8r/f3c2bmee7+S1fP9FaQ
k5P7oSgn9/ef//+nETarp04oC1kLr5zvL33R1iA73gFhC53ruXUNkKG3s3ZG
RhQ83a/JXFFBv4+FIxOV167+1ABHEv79wPnJLq2cd/T3J2DE8jyJ4fMG+Dnj
7785DZZfz/q1PKDXJ0FxgUVKRU4DsN4nBo5inQOz2aOuq96h812Aycdm1dhK
j80WHrjfZJoCgsynCc7pdP5UqFEvnqVxowGSpK9+n5gG88pSutak0vWuwuv5
M47MSG4Au38/1+GR+otdTxLo+jdggiA69eThBnjQZCq9wk34b3NlalcM3U86
CNUSnryLboCZPReEDXkNn/rH0v1lwrwLl7uM9jZAWcjfE94Gwz+iYuEWut87
MOz019ufQxpgzd/bC8yGvKvv7NXX0/3ngN7QAWeWBjVAj0MuaNxRMJnjQ+vJ
hZGeh+LeL2qAif8ucA+uFrWf7Xaj9d2DqQtPxC2Y2QB/rya9JOi9eRWc5kLr
fQCm33VcRk9qgH/Lef8AqnMExkcn0Pofgvzm9H6Vzg2g//d29B7BgGtX+scj
zeMRVJdeKdIe1gDLff7+PIa1w3el5lnSfPLgz+eDTWoWDfD3bOqpeeDSHZ94
1pzm9QTmDL84PN+6AZr/nq7pCeTNCRj5yILm9xROVeyfd8+wAZz+nfAZ1HVO
6t6hT/N8BqVGtlGPNBrg3+3tzIeC2DGGw4U03+fwxHCq7hFeA7x4/u8Hsi5O
mevDpXm/AMNxeRppzAbQ+HeDBRA72+HYZQWafwGcVqiZIJIe/zvdwkJIW2GQ
HfFHIvMogr6M7sYlLRLZeopg2Fez9V/rJTKfIvD9tHGCj0QiW18RuDz8NKKs
TiLzegmDLi69++eHRLbel3DZ4Vfa1hqJzO8l3BqaYt6nUiJb/ytYOrB8j+V3
iczzFZQP1lx4qVwim8creNL8YU3OF4nM9zW829Dx+XyZRDaf1/C/lEQx66tE
5v0aWpO+Pfn5QSKb1xswV3snN++1ROb/BjKmn6258Vwim98bmLcndMGRZxLZ
fngL4Qe+VyY8kMjm+RZsPHe++i097tkfbyEzaU3DkVyJbL7vYNVFpz6D0yWy
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
NS6GBuShhvGs1MsdhuQhPebqHjtrQB5qKAwtGrfDkDzU0FR91c5YY/JQw9G+
8pEtZuShhosdDAruWJOHGmaU4MFEc/JQw/9Vl+ePsCUPNXyRceVVky15qGHo
cqOIwCHkoYbPnbnWevbkwcXl/ZaZzh1CHlw0tlgkdul9P+cilz17qsiBPLi4
1PaH0SoH8uCi98bc6k578uCiQ6VVdZA9eXDx/M6XatcdyYOLus4v6zSHkwcX
Px7+4XrKgTykf8/pXmg8jDy4OOr2lyMv7MhDev3PTVH/WZMHF8XND+1/9D6v
uKhz9Lf6nt7nFRen3T3oVmhJHlwsPfTxmK0JeXDR40aH11Qj8uDixbYhnieM
yOPv+d/8ud77vOKir78kaawZeXBxi+5Q1yAz8uBiRrnm5a0W5MFFy8GXyrTM
yYOLfSpyOcoW5CE9f/jhjl9m5MFD1Zg/BsvMyYOHQ0xrBm2yIA8ecgXXJs4z
Jw8e+pcNuDXdlDx4WP8i4HL5IPLg4aKNpozhFuTBw0MB645fMicPHmZIVFXS
B5EHD7XZtgPjTMiDhx41r26bmJMHD71jni6YYEUePNx7trp4vg158FDZtuSN
W68HD2eeu1f73Yo8ePhJu5an2uvBw0p3H6v3VuTBw8ywmDX37ciDh7kj3gVE
So8z/3nwMDT5/PSDQ8iDh76+44pbez/v8tAyonzesaHkwcNvIab1fXo/7/Jw
mcfyRSsdyIOHseYz20sdyIOHrf5V+q025MHHsJrI1w6DZetR5mOWSz4XBpEP
Hxf5sUpWmMu+X/H42N2/8cqvQeTFR9YjddtYer/sy8fowvl1Ry3Jj4/6nKNu
vuay9Q/go46L+77+ZuTJx9hfZql7TWTzsOKj473C0wam5MvHsec+r/z7fvuP
z4GP22N1q8tMyJuPBr+9+k8fKJvXGD5qvjP68GUg+fPRRG7V+nxz2fym8nHP
kiv7pljQfuDj3mSxZbSpbJ5z+DhyxKN1gWa0P/hofNhg0zFL2Xw9+TjbfW7j
rsH0/8/wsd/OrJ8vTGTzDuAjd1VFns8g2j98vJ0+Z1jUINn81/Gx/1F/s04T
2k98FKgdisk2kXls42PlSZ+ZHia0v/hYY9Dv5VhjmcdePl7bdvSXgyF93+Vj
6a7VlzINZB6xfNygmvE+Sp/2Hx8LUhkxD/RlHif46BpkYb5An/YjH3dfd1QO
o88D5/noFMx7f9eA9icfE2O2Rw/Rk3lc56PY219X34CeH3wseTI+7cYAmUc2
Hw/OECscNKL9y8dy67mW6fT5IY+Pnw6t1ryqT/uZj1avrzx3os8TL/nI25I3
74kR7W8+nrs2uOzv9Xr+c3k+amwrH6PTn/Y7H+cGhwovG8g8qvi4aWyfyq+6
tP/5WDy1eH6htsxDLL2/95e/FPW+f/PRbo4o86G2zKOdj7mikD5L+1EfAtTt
vBHp35f6EOAOtZMVIRrUhwB/ZqTZzupDfQhQxdjsp7KI+hDgpHdnLOTVqQ8B
Rq7JHJrPoz4EOH3s5/PmatSHAN0n7V+WyKU+BBh1IqF4NJf6EGB46f49HmrU
hwBvvuE2OPOoDwFOHS6xPcKhPgT4/c6zm8CiPgQY9ijnhSGH+hCgb+CgHBU2
9SHA9IFbzBarUR8C9CyIYOuLqA8Bmqfd2HlDQH0I0Gq7meIrLvUhQK9HNi+7
+PQ8FaDbtc+nJ6tRHwLUT/v9x4FFfQiQFdmX8U6Z+hBgEae+OJpBfQiwNrxW
abwi9SHA8q68smol6kOALZP29ZutRH0IcH3LI1d3NvUhwPFJ/jsFHOpDgOxw
gcdQDvUhwD5bbsxoElIfAtS5yxZt1qQ+BOj0M2qfrSb1IcDZR/+3012b+hCg
hfxqR3cd6kOAEHdRPkyb+hBgkhZneJw29SHAvZKk7gQ96kOA114/NjnQj/oQ
YMEEe4c2DepDgLzApEkL+lAfAjR6oNo+TIP6EKDx9ScVDVrUhwCfeXYmfuJT
HwI8f3zbEjWezKNK6rvKQ/sxm/oQ4Eaz7QERqtSHALdLlm5/rEJ9SOcZ+Czo
IJv6EODZvnoFZVzqQ4hLu7XOW/CpDyF+ftf6I5NNfQgxOW3+sXsi6kOIW1Oc
rP/eb08fQjw1Kn2ZuRb1IcRjJ6pqjHs/HwvR5VRTeJQ69SHETcrfhp0VUR9C
nFsRNyqzD/UhxNF773uuF1AfQpw6eeK8ED71IX39o5kJG/nUhxCLGjx0UgXU
hxBDt/huKRNRH0KcPFJrk5469SFErSsr/qvXoD6EqPIw4Ly2OvUhxGDPU0WB
QupDiOX4I9daSH0IseSbtnNfEfUhxPaTCaYxAupDiGOWJd96yac+hLiQOep4
gID6EOLrphk4kk99CFGx27eglU19SOcXwhJHs6kPIXLcjX/FCqgP6fVWpb15
Qc+rA9L1SMIlEnpexQpx2oW0oHwR9SFEc13FuPua1IcQa/Y3VHprUR/S1++K
nBKqRX1Ij39/MI7XpD6EaPsk1CyJvs9cF6JhYfNWpoD6ECKv+ujIhzzqQ4jj
z2bxWrnUh9RTLUH5FT2v8oT4zfh7dSE9r55L7y//p/Xf3/f0IUSPhCk+phzq
Q4j93k1qW65KfQhxjl/HxwQO9SHEsSYvhqxmUR9CbFur1epIz6taIcp53bzX
yaE+hDg4ZQCzlkd9SO8/j5v+h0d9CDFB+0nRAg3qQ4T7jyz1vqdOfYjwk97I
b5f6UB8i1JjovK9Jk/oQoWp+1cWLvX2IMCLdJzxak/oQYY3W7eV3e/sQ4d7I
1DON5DFAhOpabJU55GEqwlWRdc/WalEfIozrLHjO7kt9iHAy74SZSJ36EOHi
YFvTGyLqQ4TBGbcfpoqoDxFuGDBCy5VLfYiwLKd5YZsa9SHCBSOm9LnJpD5E
uN6vbOF2JvUhwr4b8oOPsakPEV6evtXlKpv6EOHTQ6bFcfS88hHhjW/WUyfz
qQ8RevuvGJvKpj5E2DpRuCODT32IML5okV2gGvUhwq3h82dqq1EfItQZ/4p5
jEN9iHC+0oy5dnzqQ4SPF51b3C2gPkTIOLG4hsmjPkRodV9yN7H3/UOE7mY3
LlzlUB9Sj+Oh0e951IcI7fcVl/ioUR8iDHphzXRnUR8iVFGv0qhgUx/S+b79
OXUEm/oQoWFqiE81m/oQ4RD90j5+DOpDhK+edhfcU6E+pL6qDzoGMKkPEa7g
JCSOIo+XIvQ32Li2lEF9iHDwWMhc2tuHCO3kyxkaTOpDhEfOX3ZxUqE+RLgv
ZvNqVwb1IcIl+0MvWapQHyLMeDbcLY5JfYjwx+mcpdtVqQ8Rbp6+27+NRX2o
oxvraXOr9PX/BxLMZEY=
      "]]}, 
    {RGBColor[0.24, 0.6, 0.33692049419863584`], LineBox[CompressedData["
1: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
ghFHrPz9+H8mXIvm
      "]]}, 
    {RGBColor[0.24, 0.3531726744018182, 0.6], LineBox[CompressedData["
1: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
BHsHl7q/ZFP/6IZ5Q1S/vFbE+39WA8Bu
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0, 0.9894925756963412},
  Method->{},
  PlotLabel->FormBox["\"volatility\"", TraditionalForm],
  PlotRange->{{0, 5.}, {0.9894925756963412, 1.25}},
  PlotRangeClipping->True,
  PlotRangePadding->{{0.1, 0.1}, {0.005210148486073176, 
   0.005210148486073176}}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
This model has other extensions as well though, for instance the Chen Model \
is very similar and is used to model the evolution of interest rates.   Using \
the same initial equation for \[DifferentialD]r[t], we extend it to 3 \
different differential equations.\
\>", "Text", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"\[DifferentialD]", 
   RowBox[{"r", "[", "t", "]"}]}], "\[Equal]", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      SubscriptBox["\[Theta]", "1"], "-", 
      RowBox[{"r", "[", "t", "]"}]}], ")"}], " ", 
    RowBox[{"\[DifferentialD]", "t"}]}], "+", 
   RowBox[{"\[Xi]", " ", 
    RowBox[{"Sqrt", "[", 
     RowBox[{"r", "[", "t", "]"}], "]"}], " ", 
    RowBox[{"\[DifferentialD]", 
     RowBox[{
      SubscriptBox["w", "\[Nu]"], "[", "t", 
      "]"}]}]}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"\[DifferentialD]", 
   RowBox[{"a", "[", "t", "]"}]}], "\[Equal]", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      SubscriptBox["\[Theta]", "2"], "-", 
      RowBox[{"a", "[", "t", "]"}]}], ")"}], " ", 
    RowBox[{"\[DifferentialD]", "t"}]}], "+", 
   RowBox[{"\[Xi]", " ", 
    RowBox[{"Sqrt", "[", 
     RowBox[{"a", "[", "t", "]"}], "]"}], " ", 
    RowBox[{"\[DifferentialD]", 
     RowBox[{
      SubscriptBox["w", "\[Nu]"], "[", "t", 
      "]"}]}]}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"\[DifferentialD]", 
   RowBox[{"p", "[", "t", "]"}]}], "\[Equal]", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      SubscriptBox["\[Theta]", "3"], "-", 
      RowBox[{"p", "[", "t", "]"}]}], ")"}], " ", 
    RowBox[{"\[DifferentialD]", "t"}]}], "+", 
   RowBox[{"\[Xi]", " ", 
    RowBox[{"Sqrt", "[", 
     RowBox[{"p", "[", "t", "]"}], "]"}], " ", 
    RowBox[{"\[DifferentialD]", 
     RowBox[{
      SubscriptBox["w", "\[Nu]"], "[", "t", "]"}]}]}]}]}]}], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"chenmodel", "[", 
    RowBox[{
    "\[Theta]1_", ",", "\[Theta]2_", ",", "\[Theta]3_", ",", "\[Xi]_", ",", 
     RowBox[{"{", 
      RowBox[{"r0_", ",", "a0_", ",", "p0_"}], "}"}]}], "]"}], ":=", 
   RowBox[{"ItoProcess", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{
        RowBox[{"\[DifferentialD]", 
         RowBox[{"r", "[", "t", "]"}]}], "\[Equal]", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Theta]1", "-", 
            RowBox[{"r", "[", "t", "]"}]}], ")"}], " ", 
          RowBox[{"\[DifferentialD]", "t"}]}], "+", 
         RowBox[{
          RowBox[{"p", "[", "t", "]"}], 
          RowBox[{"Sqrt", "[", 
           RowBox[{"r", "[", "t", "]"}], "]"}], " ", 
          RowBox[{"\[DifferentialD]", 
           RowBox[{"w", "[", "t", "]"}]}]}]}]}], ",", 
       RowBox[{
        RowBox[{"\[DifferentialD]", 
         RowBox[{"a", "[", "t", "]"}]}], "\[Equal]", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Theta]2", "-", 
            RowBox[{"a", "[", "t", "]"}]}], ")"}], " ", 
          RowBox[{"\[DifferentialD]", "t"}]}], "+", 
         RowBox[{
          RowBox[{"p", "[", "t", "]"}], 
          RowBox[{"Sqrt", "[", 
           RowBox[{"a", "[", "t", "]"}], "]"}], " ", 
          RowBox[{"\[DifferentialD]", 
           RowBox[{"w", "[", "t", "]"}]}]}]}]}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"\[DifferentialD]", 
         RowBox[{"p", "[", "t", "]"}]}], "\[Equal]", 
        RowBox[{
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\[Theta]3", "-", 
            RowBox[{"p", "[", "t", "]"}]}], ")"}], " ", 
          RowBox[{"\[DifferentialD]", "t"}]}], "+", 
         RowBox[{"\[Xi]", " ", 
          RowBox[{"Sqrt", "[", 
           RowBox[{"p", "[", "t", "]"}], "]"}], " ", 
          RowBox[{"\[DifferentialD]", 
           RowBox[{"w", "[", "t", "]"}]}]}]}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"r", "[", "t", "]"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"r", ",", "a", ",", "p"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"r0", ",", "a0", ",", "p0"}], "}"}]}], "}"}], ",", "t", ",", 
     RowBox[{"w", "\[Distributed]", " ", 
      RowBox[{"WienerProcess", "[", "]"}]}]}], "]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell["\<\

Which we can then use to show the volatility of the interest rates rather \
than a super generalized asset.\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", 
  RowBox[{"RandomFunction", "[", 
   RowBox[{
    RowBox[{"chenmodel", "[", 
     RowBox[{"1", ",", "2", ",", "1.2", ",", "1", ",", 
      RowBox[{"{", 
       RowBox[{"1", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"0", ",", "1", ",", "0.01"}], "}"}], ",", "6", ",", 
    RowBox[{"Method", "\[Rule]", 
     RowBox[{"{", "\"\<StochasticRungeKutta\>\"", "}"}]}]}], "]"}], 
  "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1:eJxVlXtQVAUUxldCzFc1ChOawhgywAzQDhLJEH4qNj5QnpkJaxoElKYCPpoA
ywca+ACJFHyBBIK0Kw8JMAYkXRxQgUSFhV2Wfd9d9o2yUKEZux3+6Mzs3Lm7
957zfd/v7L1L4vZGJdixWKyEyY/1+P8yI92xaq0sLRPPeUUflTSM0PlPiPMT
8TjhI7jlclwXeasI1fEFKav2mOj3MoxFb/jBx9uAixesVYnl9xpWZl/W0vVV
2Bm9Y21TiRb6SOs3tbB3muv17HUD3f8rWkJOPizJNGKWoDQ5eFYjdMnHuBWV
U/1+A1t2SLr7tB5enNy7Fs9m3NEs3LV65ZSe2xCxa26/7W1B2eTdgtLfMXKq
psdv/TjNu4MOTp3WJdOCZbbio7858FXw8lGa3wa/+Y/CxvXPwbd4Tk64h2J/
9pNpL82kpx1/fdPI/erYCKJsAzvwIHG75fCgnvTdx5J0H75KbYYszdrwAaSs
mPLib82ktxMVQQfeL1hlQIpVXnIXnpbHNmYHmUl/N/Jcz7pXfWzGfxweQTPu
wcsIMZKfRxi6fGq0+gqDdbYBPThYNJrx8pCK/PWg7y17u5lvKmCdxsl9jLp0
w8JtEiX5fQJB8af8fA8lbHYETxCg3djYWigj/0/ht2H83dpPZHC1ynHpxYl5
W3+syxyiPHoR6l7vHHRBiqREa/VhWa44YnyBlPIRINLtyJ58Dwms3RyrBLjv
tziA3SiivPqx45fBnu0fSDBmbWfph4x7dUXKvkHKbwDvsHL28SKEWGFrKITU
8c/6n9f2U55C1PPtOOV7BmCTd1yEJm7IeX+fAcp3EL6eGQFd7wnR1WmtQZhm
/y0JKhZS3mIEtjqwuRuFcLIJHMKVY99fX+MhpPyHUDYceibTTgRbO44EsprP
A2dLRMRDivzXWhJiTorJjxRHJdtY1/LExEeKhS8uOrkZReRPiphpsWG1zoPE
S4aHLdMNWU5i8itD2sMJlgsjIn4yhAczxUdSxeRfjuBNIz71rCHiKYdzdspj
cYOU8pDjCDPnysuncuKrwJLKHmNXo5zyUaBwgddpjYOCeCswNse8I9mspryU
+I59AwjVEH8lJnLc0uee11J+SpxrEGweWMXQPqjA94za0JvOUJ4qdBaWXFdF
qGg/VDjQduPypXKG8mXwZdKBvBNNetoXBm+43/SpiNVQ3gxmVo4UeK/W0P6o
cTOmwNm8WU35q5HFDZlR06SifVKjT1Pe9vVuBfHQoCKs7EJ3h5x4aHB8a5pX
SaqceGjgO2++P4+nIB4a/JOrSupaPPX/Gcb+1LiwqpBh4jGMnPLE9bVnpp5P
w9jV2x608w8T8dDCTRcR37bIjLM2HlrsOzg9oC9GTzy0aHlxt+bVlmHioYOz
Prf38X4j8dDBO3CNy/T5ZuKhg8/Wc3tzXQ3EQw/1UEb42Uoj8dBjWc6zSx4f
MsRDj+oF8jz30SkeBqxzHFuaVaokHgZc+8z+0gsnOfEwwBSbvWWpq5J4GHE0
scOr2JchHkaoanu7D0NBPIzgOVzl27fIicek792tqe0xSuJhAjPgzY5fpCAe
JsxIad40Z0KOqfeGNnIsmvuFDP8COM0r3g==
      "]]}, 
    {RGBColor[0.6, 0.24, 0.4428931686004542], 
     LineBox[{{0., 1.}, {0.01, 1.1623942170005723`}, {0.02, 
      1.0476184851080126`}, {0.03, 1.0483676053493423`}, {0.04, 
      1.0501579448051297`}, {0.05, 1.3316373210572607`}, {0.06, 
      1.6397831913640613`}, {0.07, 1.7883132016093684`}, {0.08, 
      1.792481650235058}, {0.09, 1.8899648320006108`}, {0.1, 
      1.675744397447316}, {0.11, 1.552134420588297}, {0.12, 
      1.9180052086038832`}, {0.12827024925002925`, 2.183451644542476}}], 
     LineBox[{{0.5280325724645769, 2.183451644542476}, {0.53, 
      2.069391773483813}, {0.5346401140353577, 2.183451644542476}}], 
     LineBox[CompressedData["
1:eJwtkWFIE2EAhucKDNMgWSJhHUMx3SKnJeSP9Yq0FpSIQtpiIEVpUJHSD0lz
RDEk2piIQc4oYUYquSBqKYpmhhSl/ZleqIFrd9ttt/Ns45SJULvre+Hj+/fw
fN+jvXK77ppapVIVp458Xz90Yc5tDGJoSLC9b0urtPO1Y4ftQVQZP/a1FeyA
9rQYM+ggNjsrG/srtlFsdX2Sihh8m65+KkZ30KHxmgPtDHoqRl0327cx/10e
g9xbR3QfSrdAKUAWL3oWMp5cjaM1RfO0sBgX1LNDlIRZqShFZOH8kla4O7iF
AzJOE0Lmqr4s0JZAc5O8EHKymkbsVgkpuRQwhJM5ayv6zAQyFMEwag/OdO1N
JqDoWcMI1ZjKf4/GoeC8YZQY6j+XLCSgUsah3Gf8+Y6Jo04Bcsil+l/ZkhsY
lJ/r4WAoPe8RswVsynoSh5b6cNX8Yw5nZZw5AkP+4h7vFA93n7wIzjmlXp15
AzH5+/gIOtUXn5lZDqcUwSjoyQfDk2dYdMt6rigK3IMlXeoIFFwgiqRjpNXx
msNxZTwK3zwKT42x+N+DR/bcS0uemSE9eGgnlnQixZAeMQyw6X/rygKkRwyU
19F8YmaN9IjhWMel8prhVdJDwFvW3q2rpkkPAQP7//xquEeTHgLSWy2Xrb5F
0mMdmvu7bLn5ftJjHYUu/93nO4ukxzr2OX9QR2/QpIcIk6khXVvvJz1ELPVO
8/wdmvQQsez7ymblLZMeG3h4Wt84blnBPwMpSHg=
      "]]}, 
    {RGBColor[0.6, 0.5470136627990908, 0.24], LineBox[CompressedData["
1:eJxVlXtMUwcUxtmC8tjCpkFBIIAvhoJRJ2PomJ8SBXGCBQGdwCIiQiZTJLJY
DA8LLmGbAzMewjKLQqZkGfMBgtFUELGIgDwLlodtaUvp4/YJDKMy253+sZPc
3PQ+zvm+73dyu/LoqeiU921sbFLeHebz/0uHc871YeLsQvBtC+eTvmPodyly
2LwG1YQWzZ4XVFHNVxAYAruTHC3dr8XGg01Rce0MqirNVYe86th6UZGOnq+H
d+VAkf01Buoo85VbGHse9I1HnvX9BkQs8itsrGbgOFyT8aVjE/I9M8XTTlrq
dw/LU7rfmLoNWJdQ/GjG9wF+cK0bf82z9uchsuWrPzK/NqL23dvDNS3I6Rn6
Iq5QR/Naodjmkv56qxpbLNWGic5F3K191vmPkcOk5SiGtWib8X03oR29r4L3
rDqtIT187K/oL9Q8UiPaMrADzr799578qSN9T+F4wmQMbFNBnG1u2In3HKLc
bCNUpLcLn40WdbNuaXDaLC+jG/Kld8s3DBhJfw+e8Vdu+uWVHv9x6IWDIOl0
hp+O/PQinv1bpLO9DnssA/rg7O0jERm15K8P8urUbyMdtTBPSyjux76+xN/r
XurI7wDS/mnON13XwWJneAC7b95RrRXoyf8gOEKWY1OVHl5mOZ5DCIhfvLpB
aqI8hlAa4nP4w0/nkHrcXAKwFzxNG1/MUT7DEKbfvp3oMQNzN+f6YcQ/FLB2
es1QXiM4s1vw0/zHJsya282MwOi3t39zvpHye4ElnTz3rFUGbLc0FKJUpcsK
8DZSnkLo7jt8dJfPwCLvwij4fn9Vz7sylO8Ywh8kZtb6MujuMtcY+rtcdg1N
WvMex25bPo8XrMIyi8AJZIat8/ZkW/dnAq0nhGGxU2pY2iW8RPEs5+84tZp4
iLDNM1L23KQhPyL4J/ILRkOVxEeE4+3788+O6MmfCGs6G8+lJBuIlxibOriq
eZZ1n8XoOPR2fFO6kviJkVqevKzkvI78SzDgZZyNsdMTTwla7A/1XG4xUB4S
DPLW1splVr6T4GSGhS68MVA+kzBVjlYFc/TEexJPCmRnygxGykuKA/671lce
nCP+UowEXGItsAyUnxT7hAc+vxRtoH2QwT588WCJQkt5ylDm43L5WZae9kOG
/hXuD2eL9ZSvHL1cdvftXIb2RY7zP48ebPXQUN5yGJxulnGO6Wl/prAm6LD7
7Ckd5T+F+2lZglC5jPZpCm+XRy+N4SqIhwIN1xBYukNCPBSovXLsk4pcKfFQ
QMEdjNjQISUeClx0u5jXODtGPKZxlp17cTBRTDymkVxdNFSwXkY8plG+xS5m
s0RKPJRYHbswcdVuEiUWHkrM1exdevaGnHgoYfo+q+qoVkw8VJBHeFQUukqI
hwrXr87HrVBKiIcK+0S5/jdcZcRDjeSYJH2ft5R4qPGrW9teadsk8VAjKvi1
iOsuIx4aBO6sahZ2SomHBkeetoc8lkwQDw2Sst0E3AEp8WDAyrnjcdKgIB4M
mj+4NX+3SkY8GDBjvh5tO6zfXy1C9E5CZZCBeGiRtvKx6MgSI/HQIjuc185m
zcD6v/HjdrW9T5cB/wK8uzlU
      "]]}, 
    {RGBColor[0.24, 0.6, 0.33692049419863584`], LineBox[CompressedData["
1:eJxVlXtQVHUUxwGtBsRNHHw1BT5GAwLFVEZH5WtGgpkkBGG6g8pDk1BYMxkQ
SyQQQ8NQMyTLEEMStxCVJUARIZXXACKP5bXL7t27j3t3FxAQmCJ2O/tHZ+bO
nd/v3t855/v9nDt3QVhMYKSNlZVV5ORluv8/jDjqKPaVJ3wNbqxRx4/20/o8
ahaP7S+MeA6JU4ouQPITPky9oU5tHaTnuRAFX1k3ccqIS1mmyEf5lfrQyhVG
el+M3Hn+Q2mifnABpp1CrFr52fVojqPzt3HyvZj6mE+MsGu7GrverhjfzMyu
CkzmKF8JZhZO3Ev11cNVmFE55FKGrHkfxH38F0f57yFno91HcxfrkTt5uu1q
BdqV58uzBANU7wHqznVFx3NGrDDHQ0z3Csne5MVT/Soc/yqh+HAQj4dDLpMV
qsEELb0VK9JQP4/QZ5fnfVTAI9Bc8DHuJ8YJGn/QUX9P0Per6+/HQjjIE0wJ
a5BrXB5ovGvptw4z3EMSC/boIDK1F1uPdcyEV1yAivpvQItLosfmERX+49AI
tUTR+3eDmvQ04vSsovTaERZ+5gJNOJR5hlH1cKSvCVVJq4rl/2hhqibMaEaD
zKFO3s+S3qcoizpzqbVLC7OctqeoqM6eJ/LUkP4WrOwpnT1gx8DZ1I7TM8Tq
7KfGz2HIj2dIH0mqXiNUYd9eU7QidKGgKB5a8qcNJf5ClwsePEzZHMVt2FLm
Ptw9ZvGrHSuabr7Y/10/hk3phtqxtXZX/GkJT/51wMkzo6HQ2QBvc0IpaoKl
lTmXjOSnFMuLRMLLC3mY20vpxPQItmjZRgP524WokCm/pEKP+jpTdGFTVNjr
l9fy5Hc31s1e6vlWvwazzA32oPzVu+L5SjX534Px/g2PDszQwZxO2Iv2dIc9
L4VoiIcMcxXWI3mZLOmRQXKQlfjHW/jI4FNaffzFXob0yaD7bWtlj0xDvORw
SztzdqheRXrlkL35OQYSWeInR7PEtz1hP0P6+1C3+8vi5PflxLMPNjG+ST77
FORHH05El21/Uaogvgog+mDzlpf7yB8Fsr6Y3XvgpIx4K/DIfmpcTUIP+aVE
qFhYHXK2k/grEe7x7i7b2x3knxIdbErA3JVSmgcGwleCRzNlUvKTwVjJsoWR
AinNBwOP/Ks4/E4n+asCu2/plJtHOmleVMi/s/qBdXIH+a3C/fDBGz4FHTQ/
LLZtNjxx+UNK/rNot3dcPn1URvPEIuVi0+VGW4Z4qDFueyUy55iCeKjx2kT6
EbcWJfFQo9W6taLczcJDjee7xZ4Co5p4aOAdk1a3yZUlHpPrU4GLKoLUxEOD
s8HJ3ncylMRDC53rKJMsmNw389Di0PH5O/7cqSMeWuTUtq1e84wnHjp0P7xW
UHNLTzx0OBgXNmd8q5F46PD9FD+PSIOaeHDwNQT86KBliQcH9Ya1S5oOqYgH
h4isDmZ4vYZ48PAKvL5EyWiJBw9n+5KKU/Ya4sHDxnmbT+UOhnjosXPahWtT
/Szfrx7eC7SPz8nlxEOPtYWLtl8sUBAPA74deMNPZM0SDwPyfg4f/tRTSzwM
eDvqRO20RYOw/DcMfu5WXLAR/wKIyzFj
      "]]}, 
    {RGBColor[0.24, 0.3531726744018182, 0.6], LineBox[CompressedData["
1:eJxVlXtQVAUUxhchZaCiIRZtLEjUUUQCjTQx+WawAWVsgKV0FBoNAccsRQw0
A9oGFEQUeQg+gJwgESGMxDcQAhIyLPHYFyyLd99vFjFoI2hit7N/dGbu3Nn7
+M75vt+5s8vij3ASF7BYrMT5w3r+f03gG4+GcNnJbPzDMp3oaLD/LoH7Op6l
ZNk47nudMkTfr0TWzkfyYE8j3a9Gqm9hxrTQiCuXrVWLDzIfBi2bM9DzDXCW
/eU4ZDHDGG290ohtpx1uhPaY6P0mBJorJjdNTsBFVJW8xeUekpfwbnMtE6T3
AMUT69exnxvgG1fQPrW6Ge1NQT66WS3ptyJ2riTK65EB1fNvi6rakP7nhDaq
QU/9HuPFYKzP7ooJvGurDrg27OjOeWbv34ka/40LsotM6JhaPd/hCXi8pH3v
txtpnt/g9NqeAxxXEzi2ht3IYXW5J4nsfp/CKIlnPU3QQnbSKtgDibkv4JNM
Lc3bi0sZq97Wuhtw1DpeMg+qo9k1gz06mr8P3LRdWTlpOvzHoR9uGF1YO233
0488mdNpU6kO22wNBsBrWsSri9aRvwGwHbweXzumhbVbXMEg9h7ghEeG6cnv
EGKEg+fWJmhgsyMaQqVjcLj7CwX55yO+aGHpTwYVvK3jeAkwLeKed6lRUR4C
7HW84Lxmkx4HkqwlhNuTkPhZiY7yEeHjodrrz530sKp5NIggvNIdd3FGR3mJ
oQhq+6rLWYNpq9yUGOFh5qCZWDXlNwzpZxZ2Z5QGITbBESzfkJ3xNVtNeY7A
3YU9Uh6nhG28UxIEOZwd25mjpHxHwUmetVQdVIDXa61RPEi/Otobo6S8pXjC
bg6QtsjBtg04hu62S2GRISrKfwxnJay0E9dlsMnFPcOr7ywBU6QgHgz6v/Sr
LY1WkR8GnpG3Q3u2q4gPg06/RU0zV9Xkj0H971y/tr8VxEsG77S1F6tZCvIr
Q+Oe0kJtIkP8ZDCvKllR7MyQfznu3fCte7OQIZ5yHKnrnCzzlFMecqwsynA5
9IaM+CpQb5m6kl5sz0eBqrXlD103q4i3Aknm3OzjW9WUlxL5Gzxu9qariL8S
EY6eNa1ZSspPiV2O9374I11J+6DC3u9K8q59xFCeKvzKdAYUtDC0Hyo0H3Yb
EPnb81Ujs+xyaOsKhvZFjbs1+XOVgVLKW41b+z0OBgyO0f5oEKj78XzfVSnl
r0HKoi6Fz0IJ7ZMG2ycdD3mnjBAPLVI5+VVrWoTEQ4v1im9XfrFPQDy08Chj
L/5llE88tBh0Kh4Yfp1PPHSQcwN2+Pfyicf8dzj9ynTpbj7x0CHreuPPpbkC
4qFHx63CxO5ZPi7YeOgB7pk7yBEQDz0WR5ruvHSGTzwMODw8nuN1kU88DLAU
dzw9zhEQDwNe3vqeKpArJB5GlKdWF33/qYB4GJF6N/pmRaWAeBiRVq7drAgR
Eg8TIlhdqXxnIfEwQbOx8EPRBTHxMGG//vNzzI1h4jGOpf1OU8feGiYe41iZ
UOWxZUZMPMYhzV2f3FsxQjzMeOifogl2HSEeZoiDjx+b87fzMCOGFRdRL5DA
/r+RJ80eEi8dxb+UPi3Z
      "]]}, 
    {RGBColor[0.6, 0.24, 0.5632658430022722], LineBox[CompressedData["
1:eJxVlXtQVHUUxwlpVGQQkoeai69MfCCGKPjIb+ggZqihBGGMr0QyQ6yQApVM
FiolcBaMQC0NBjCVwhHFgUFUhOXpEiyPfeC+YNm7T3bZFV8Qux3+6MzcuXMf
v3PO9/s593fn7o/fEWNvZ2cXM3ZYz/8PA467lYZIk9nw3HhlzTq2nq5zEPy2
jzEj3IAKrzR1WMVvCCjObPhhl46eF6Jo+tVrZhc98vOscRUKS9vaxJzx90sx
WspM2G7UQRNmvVOGSE34GtGwltbfwsYA3Ln+sxqOXQVH33W8A7N+0/k55TrK
dxcra8s4uRf0WBSd9cDsXYW/Lbu/f+5lovzVOPeHY0o2ZwiFY6u7CmrA8v8p
a3jARPXuY2Grqc1iGMQKWzxEau1bx0tyB6l+Lcy3O+b9XmHAQ7P3WIVHiE9w
sttepKV+6nFpYeB01yQtdtgKcjG8y6E18cp4fw1QrPrQHN1qgDTZmrARQxO1
oR6MkfptxkWnX5s2VQ7hS2t7R1swyXVvdf1pC/XfCnHnN+75kWb8x4EH5/i8
1MuxRtLDQ2gNb2vzJR022wq04bB9xuISrpb0taFodnGwC1sHa7XorH9QWedx
1pLCkN52VMunPvjqPgObnK52NG7L44aHMqS/A0+WfL6nvYnBbGs7Xny4lWRN
XPFSTX7wYYqLcFDtZRB70Bqd2MFpZfHr+smfLiRWS/Tr/BhYs7mVdiF/dYtn
bKOS/OrGXwdqN9ZL+2CxpjN3w8XTK8k3TEH+9WDp2YoNcXop1tsSClA9etrQ
+IWE/BRg5NS9oLlNEtjaSxPil3MHduUukpK/ItQ5FbewF8vQ0mwNEdJTuPJb
8+Tktxg8e3ZH+YgM7rYGe3HdGDHsO01G/vfi2Y30FqWTBLZ00U9Q9fTHjDOb
xcRDgiVzsrtjncSkR4K7qSGVnmwR8ZGga1lD1MlnAtInAaedN+tKp4h4SbH1
0Jbn6nAR6ZWiKpmvG+CLiZ8UjyLg41QmIv0yTPbbWVzPFhJPGbbIk+LPlwrJ
Dxmc1/PTpxb0EF85Pm1O4c2Y0UP+yOHipfN0WC8g3nIEHxnm1MqE5JcCmRf7
C52bBMRfgU/aTySP3BOSfwqUp72junpQTPPQh/M+M18IQoTkZx8+3sepYS3q
pfnow+Hl+jVLVQLytx+PptitLB0W0Lz0AzNY0aPxQvK7H5+FdmsDEwU0P0rk
2HvPj50pJv+VmMXyiIw4JqJ5UsLX3WS4/EpEPAawxzU1mp8kIR4DqMwtDBpp
kxGPATDzL7ifilQRjwHkVbQ85nykJB4qBLa+/PrGdiXxUME767X90yIZ4qFC
UfPDY1GuWuLBwFsc8+YGrg7nbDwYXPvu8gdnNOPfO4OqiuU5O1km4qHGxJsT
NK8STMRDDY+1T0/UTRokHmosO7Iqoz14kHhokB1zd1/HtfH9SIPXX0XsLNg3
RDw0iHkRwTXuNRMPLd53LMg+lDO+n2hxe8o6vwt+JuKhxW52wuMVi43EY2yf
Lg56L2qBhXjoEOC7ZHTyaR3x0OFU/pneKEeGeOjRc9Jf5n9TSTz0aPNwr+Uv
UBEPPf6Mk5ekviHH+H9jtd+2bwMy5fgXPB4v4w==
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  Method->{},
  PlotRange->{{0, 1.}, {0, 2.183451644542476}},
  PlotRangeClipping->True,
  PlotRangePadding->{{0.02, 0.02}, {0.04366903289084952, 
   0.04366903289084952}}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"RandomFunction", "[", 
    RowBox[{
     RowBox[{"chenmodel", "[", 
      RowBox[{"1", ",", "2", ",", "1.2", ",", "1", ",", 
       RowBox[{"{", 
        RowBox[{"1", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "1", ",", "0.01"}], "}"}], ",", "6", ",", 
     RowBox[{"Method", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<StochasticRungeKutta\>\"", ",", 
        RowBox[{"\"\<ProjectionFunction\>\"", "\[Rule]", 
         RowBox[{"Function", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"t", ",", "xvec"}], "}"}], ",", 
           RowBox[{"Abs", "[", "xvec", "]"}]}], "]"}]}]}], "}"}]}]}], "]"}], 
   ",", 
   RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
   RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], LineBox[CompressedData["
1:eJxVlWlMVAcUhQlQjWNESwFFKoVUZUAgJZQguBxUtIJgRYOKLAaVWi2NiAUV
Y9C4FlnEtlahSlVEsUDDUkEWNwpWi8oOgsAwjDMMwyyPNxuMQpnhzo/e5OXl
bfeec76bPMddBzbHmJqYmMRMHvrz/0uBY1ZFX/Unncay9cXRXhYjdP0zLHNF
3TNaGFTYn5GEVFxHgAly9oQo6XkuBMFXlkeFK5F1VV/50Fr0FZ5arKH3ixCU
FnOyY42J33CI/k4xuLMzG3+LMfGb+r4M7umrJFV3P4DTcStuBacc9YqwheNm
49TvAebm5S4RMu/hHJHxVMWtxp5nmL4vb5z6P0TuJ+qfOL2jyJ38uuPWYzyU
rBI2fKnD1LwnWLzikmrtczU8DVWL59ola3wix0j/39iuyDxwYYJFrYo7OaEO
dyo2td84pCI9zxAhD/SISmKw2TDwH/z6ecinpllGv8+REL7AfoNYh/4kfcMX
6LlUk+0wriG9DdCeN3OtYbQ4qJcX9xKWjdEB1QnvSf8rpKz0WPLjdB2mODQi
Njs86fheLflphNDctTM+XYf1hgFNqO63EGf0jpO/Juzf9Mq31kcH/bSIjGY8
jT1/7XKUhvy2IMZs0MEpXgmDnY4WONWXNpUsVJH/Vpj5WS8Lu6nCZ3o59m0Q
CAtdJ5JVlEcb+Kri1QEfWOz9Rl/tcPQ94pJczVI+HdjgW3OhJI6FvptVUQdG
jpvNiC5nKa9OxO6ws806OgK1vp1q8toy67b2Xy3l9wahldsLmmdrsNLQsAvO
s9riyy+zlGcXvq/1/9YmcBQGeWe6kf/Yx8YtRUX5vsXWJo5l6k0WLxv09RZj
LkWZ014oKe8etN+IqE75SAVrg8BePLp7u9i2S0n598Ld28Pa6Q0LQ7uIPnTP
OvVX6h8M8eAhseLJrlA3JfnhgZfkvP/wkRHiwwPzaCdHdJIhfzyE8qNfH5wn
I179mHki4uy6OVLy248a26itprsUxK8fpmFdP2y8x5B/PnSulZ0W86XEk4/g
WWf9ZpZKKQ8+VN2tdUEbpcR3AInb5uwbVMgonwGoOQvuHdsiJt4DkO52FKUV
iCgvAe7uXnPR13OI+AugORXp2BIup/wEGD2Rt00uV9A+vAOb7jJ7rh1Leb7D
YTbqaqbUuB/vULbU6k+fPjXlK4R5Qnv5vONa2hchIuuDvPI/Nu67EBMOKaGX
/d/T/ohQZWMX9lqppfxFeDjtu+GG/UraJxGuxuXbReqUxGMQX3dqqxZNjBCP
QXRvnJ7GKWCJxyDcPVYecvaWEY9BZN/8paG51chDDMXrpU+uS4aIhxj2u7eM
xRUxxEOMc62a3kXLWeIxBO9woXfOBgYXDTyGcKX8dFBVhoR4DGFtaSMDpZGH
BCea3coqYo08JJBwK3fkOcqJhwR+gZvHivzFxGMYNTvVqSkeRh7DCPV8Fpaf
yBCPYUjPHT02ZMUSDymEGa/8OmsY4iGFWposW31PTjyk4K7taZOai4mHDF0P
suYztnziIYNT4X1O+jUe8ZDh91KbZK87POIhx/2JHE/uOJ94yDHqK//CtUxE
POS4nrP9ZIm7AMb/hrmuDv7BAvwHnrUupQ==
      "]]}, 
    {RGBColor[0.6, 0.24, 0.4428931686004542], LineBox[CompressedData["
1:eJxVlXlMFAcUxm1FLKAFFSRQK2oIAgWv2lSp7tcCxkUr4VBE8aaiQoMcRhDS
EnUVIygogkrAA2yB2lJKOCRQFBF0G+RSWAXdnZmFvZfdFViKUi27ff7Rl0wm
c733fd/vJbNw3+GQ/R9OmTJl/+RhOv+/9Ei1L1/PpgigCFWGJ+QM0fUlLPJe
vFD0QoU780+pg+9cw2iBsKyyRUvPb6Hh5eFfspRDyL9qqjK4eHi4b96qp/fL
ofK2nmaYo4cm2HTnD8S8C/xe3/1+XhV+XpySWbJPBWtRcdxa61ocs6zjr/NQ
UL86JAmcVroq5fDYkXV/1L0BS8K2FmSlK6h/I3ae3MN3slLh1uTXouJ7WHVo
wcsMgYzmNaHR7yfmSKsMn5urGfV5cff9cqU0/wEuXb+wt5Lj0DzqPjmhBQUb
A8S8dJb0PETCtqqGP4s5hJgHPkJb+q83bi5gSZ8QpVss/PutOLAppoZ/IbHV
qabHkSW9bQiOXd4gzOQQb5IX9xgVSZlezd4s6W+HZppDbHIOg/84dMLuccXB
1acZ8tOJzt8t3b6NloBvHtCFvsTk9a4tEvLXhbm8nRbhIwxM03ZkdUNSOtCc
EMiS3yewcS2JOtrPwWxH9AS7ju9dkRTGkP+nSC1KDphlJ4GLSc78HsRE2cc3
WzOURw/Uzkc8L0eLcSDKVL3osBDa/sOIKR8RjkVlWApsJTB1sy8XYdf9lQ8v
+0sor2cIn3U0vzWSgdHUbvQZNgRIctNspJTfc4zX2mLsMxl45oZ9WCM+ELsm
fZDy7MONkxYPcjqkMMs71Q+vRTEznzlLKd8X8Dtoc016mcXjNlO9QFGVU8Mn
PSzl/RK8kVDV6dkcHMwCxfgyoy740dMByl8Mn9KSd+0bpDC32yEBq91oM7WD
Ix4MXkfZBYn2ysgPA54s6lavUUZ8GGza96AWPnLyx8BgYWe8fVFBvFjcK5J/
k58uJ7+Tuk4EXbDN1hI/Ftcqkv22T9eQfw4e8YKzeyKGiCcHb17gcV2XjvLg
UNCx+NOddw3EVwp5xeGkG02jlI8UXMu8vsIiI/GWwjNmU+GqnBHKawAVY84n
c26/Iv4DKK4+l7HaQkf5DSCBX31lppeB9mEQE/wxz940LeU5iDT7uOsOZXra
j0Fk82b8VrNeR/nKEHQxNrSuUUH7IkOabWlqmVBJectQfbc2cuoMDe2PHN0f
uwqqhtWUvxxdyzuXODB62ic5pGmHaiNXvCIeCnhZXZyeN/GKeCiw7kzciONV
A/FQ4IuaLTXL7gwTDwV6d4etadtlIB5KHPE5wd8QM0w8lCj86tzu+vPDxEOJ
3tgfjTl5RuKhQlxmYoqs829km3mo8HqZu9A1Ypx4qLDdzWVW97Zx4qGGd+Qj
X0H8BPFQo/JY7Edn574lHmrwNvc7uy0dJx4aSOc1itsD3hAPDZY9T4u2PT5M
PDSYcNw+kp41Rjy0aPUt4Ht8MEw8tFhVltjk5jNCPLS4G8R+93aOgXgM4Upu
4OzCfD3xGMIZ/9Uh9UIt8Zi8Ho94y3mqiYcOb7LXGX0XGoiHDqnR6PL9QU08
dFhbnXnz68kc3v83ljbdLAmdNoR/Af5eIwc=
      "]]}, 
    {RGBColor[0.6, 0.5470136627990908, 0.24], LineBox[CompressedData["
1:eJxVlX1QkwUcx8eYmi4kaRBlohIc5B0JreQs6fskdpjnIWDqeSAkBhQUIIrg
wDNAINQAhe7StE4FddERmhqCvciLCvLmYBsvAoONsbF33Sxf0Nien3/0u3vu
uT0vv9/39/18n9vS+LSoBC6Hw0mYOezn/5cZOYLasDHRATwLXZLZGG2h35VI
dcPK9igL6r0KdZH1P8LfEl0ynGCk+1XYcsFNVfC9GceP2UuMIq5VETplpOdr
cZS7PG8vTwd9pP3KBTx4Me39mofP37+E3G01n6atMmOe/Ex6yLzfkSaIiI2T
66nfVSTuqJLN/sqIN2PKmmz+1xAbvDPh9cbnev6EzXPnU79HZlTNvC0/8zdk
Ryt3DRlsNO86Dm7ineOnPobQUc2YuzG/RFXwiOa3IGJlwSX11mk02/xnJrQi
pFPkfVk4TXpuYklFq67oLIeJcgy8BVNvraX0II9h9bUhfJU2p3/UiRkT2Ru2
Y2Gl4capb2YzrN4OrFZUH3U/NZvZaZeX3gm3nIcTlyOdGFZ/F7yP72qS1PIY
lkMPivcvLapeM4th9+lBzvyXDFlKHrPWMeAOAnSuuaIILsPudwf1G7Z6GkP4
jH1aTJkEbwVndbuKeQy7by8OZxVaQjROjGMdeS/WXknOVPtwGHb/PsieJjRd
dJ/GYrscLyneEfybnrTImWH9kALBAr5FOItJSrSXDClxBWO6E04M648cS/o/
ORwY6MzYuwlq5Xij7dKHggou+dUPS0ZWe40Ll3lgb2frx9fFy4t/LeGQfwNo
6Kpv8dJymA8cDQfRlhr7rTCeS34O4jTfV7G/+TEc8gqHMKIvvZ3daqM83MVi
p/jrhU8s6Oyw11389RF/uEx6D6zfw7hyPn/hzx734O4QOIK6vY27T4rvU35G
sDvK2ee9DDMc7WJGcdmVeSJKuQ+WhwK5ps9XNK2/B3YfBbxLzZ9lJt2nvCnA
TfKbk+pmBbufAk3iE7HHDlnB8hrDA+6XHj2dVsrzGFJK88r5k1bK5xjCbz4+
u7nJDHb/cfjdHraIOg1geY7jD/0WyQtBBrDtxhHgHyeYatdQnpVQhj2UhGdq
yB8lvtCa/LyuToDFo0S30nvO5gAV+aXCmuS8G8+uqSj/M9eXveIVKFSRfyr4
Rn1sFjMaysMEyj237wvM15OfEygSLnD1zFbT9zKB+XzPmm7rJPmrhjzl+L7y
sEmweVFj+NXggLogLfmtRtKoa3UN30Df1yRihjm83EMT5P8kggfX1Y1XjYLN
0yQCe7My1O6jxEODDapcjz3/yImHBvPXl1fmnxggHhqsEyUfqfaREg8NVnuc
F+or+omHFt9xjkRnF/cTDy1yN51e5psvIx5aNI/nBbWEyojHFCo6fX+qEktR
7uAxhVu7E+cNxEiJxxT2vPvDirpSGfHQwXxn0ctds/qIhw5DGYqwjm4Z8dDB
Ft6gOaeUEw892kfU8a+NDBAPPUpSFzcPmYaIhx4BlU5bXQyDxMOAiz4bxT0p
cuJhwIL1iDow3Uc8DIjmt1YYw3qJhxHWlsG5J8clxMOItyM2JXdJpcTDiLId
qm0uIhnxMCFfl3Q6RN1HPExIlzScGvSQEA8TBlYltv2yXYLn/xsj2bfMv7n2
4j82BheE
      "]]}, 
    {RGBColor[0.24, 0.6, 0.33692049419863584`], LineBox[CompressedData["
1:eJxVlHtMU3cUx5E5x2MIQ0iUhddERHRkKmyGCF8TtskEycA5FyRRYCoOEdiC
AQzIEBFdtEBAXsIcdSJLLD7YgIWRChqUyZtSHgXby21vX5RCLMgcOFpP/9hJ
mpu293fO9/v9nHs945KjjllaWFgcW/kYr/8vPc46CfbKMvNg+Vl9TnX1DH0v
geon9RV+gB7Nbhc0kc01uJE+X7nYrqX/b4INcx4IkWhQWWGsemzPY5Z5x7R0
vwBhuz/wm9+uhjbS+Ms9hIvOXSpKU9H5RviuG5JEHNfARsxPCbJpwsR3jvdP
b9RSvxaUh0UzbvNqbInhtRt8WrE8YbWm6KiG+rdhc7rOK/ieBjdXTov5QvgO
lB/i71DRvIc473Xkx5QaOXaaqgPd2wO3zgcwNP8RgkJz37saxKDD4LMy4TE+
Xags++gBQ3o6sU3g7XFjTo4o08AnqN7nlTzhxJK+p6j3LO325xjIMo0Nu7Dn
5+jGa6vlpPcZXNV1QfZ/qpBqlJfSjX8Wb7kvv1KQ/h74sJLC1UIWbzj0oeGX
40LbtxXkpw8bLXo254bJEWoa0I/4pvTRF/4c+evHKoV66GmmAsZpMbwBfHwg
oC8tR0V+B/GsIhEle5Qw2REPwj2mLe91goL8D+GvyYIJkbcC7kY5biKccQq+
Yx2vpDxEyG7rWhJcU+LEcWMN42pr3L4AFzMvMcSVp4ufXJ6GsZuTQAyr/vNO
fhE6ymsEV10v1ommdJg3tjOMIP7waqsmxznKbxQNjz63iyuYQ7Cp4RjyT+a4
2PRMU55jMHTzrM8J9DDJuzAOvltPY0X0LOUrweyIts3hBz26nxlLgoZN1sni
u1rKewL8viO1969zcDYJnMTBLM/UbF+O8p8EM77kEBWthqldzHPIamvChXol
8ZAi/2tZzrbDGvIjxfPiRrtLGUriI0W4v+RlSK6S/ElxzpCYdPuMinjJ8InA
ys+1hiO/MuzKCSx0XtmPN/xkqElffidLzJF/BobR0Z6MApZ4MtjDL7J8VSCl
PBgIPV+Ib7kzxHcKJct+xRvjFJTPFP4dLrKJWKMg3lNw2RKT3GHLUV4spO//
7h13Qkn8Waz/NU9VUMVQfiyWhbvetf5WSvsgh0JaVbuuaILylGOg2apG5iGh
/ZDjjy9qrbBBQvkq4LrgEsd2jNO+rOylzczDFvtJylsB9ivHqthFGe0Ph4YN
otCLnVOUP4crl+/4jsXKaJ842Lv3Wm/hyYmHEt8U90b1dXLEQwlpevvckkxF
PJRo5WWfOrigIB5KJJ1J6DpUxREPFbI7Lctz5szvKxWqEnt37C80v59U4HrX
yufqNMRDjUnp68T4t7QoNPFQI8s+xKY+TUc81LDY6nvqwPAs8dCgzJYLmQ2c
JR4abGKEzz3T9cRDg5TqjA+v2+mJhxYJCevZfR5mHlqoNe3B/pgiHlrsF/0W
8f0Kxzc8ppHq6ui8FyzxmMbkyf5dnV0s8ZjGg0iH0peDDPHQQZpWkXTUmSEe
OsTuruhO7DTz0EFy9susMhczjxnsvLuqxX4tQzxmUFp3pzlfIyceM7h9z15u
4MzPhx6G4L8fO9np8B/sTS8h
      "]]}, 
    {RGBColor[0.24, 0.3531726744018182, 0.6], LineBox[CompressedData["
1:eJxVlXtQVHUUxxVfpOBsuoYMsqTJBIgpA4g0I18yTdOaQiUVsUhBMk1BKExK
nHTVlKcBiiOmsJRooWKFoAnq+iJAHsIiLdzH3rt32YV1lQAJGmK3s390Zu7s
7N6953y/38/5zZ25aeeqGIdRo0bFjFzWz/+XBcnykmXcngMIP3lLtjG2m75n
o9J577VpWSZcVShNYVdPI/DU3nD3FBPdV8Etwlj6ztNOnMyzVjE8384NL3Y0
0P9LEO4vS0/IlNAVZv3lMk6Vu5zxPy7R879gRdr40JACCRM1hXGLJpZh/qvx
O9krIvUrx2of+YaBEBHekRm3er2uoyJo0FkdJVD/G1CszI+6uVgH1cjTmsIq
nMmpS9Wu5mneTWTdPRZkrtbB31a30eRb0GNo5mm+GtqhwhynLB63e71GJtzB
anWLz+TtAum5B5/W++q7aSJW2Qbex/IXCtfuiRBI3wO0+DpkHjmsA7fH2rAa
vOkfVdgwT3proA5uig+bLyHeKi+uFlc2TVnovciuvw4PXHctGVYJ+I9DPbgs
D68oL4n81EM523JwyFXEctuABkSHHLr/+ic68teAc7sz3Qs6OVinRWY0oqfQ
X1Gi5MlvE0rXz60zX+Rgs6NpQuhneRFxP3Pk/xFS7+QmfZvCwsMqR9GM+Wv+
2uHbw1AezZilOTe8rp9B7BZrtaD32ISzEs9RPhqoK4Ii+x9zsHaTl2jwsWeQ
61qGo7xaEfi07eiXYNFnbdfbCsP1mI8sFobye4wZjsvfMMcyCLE1bEOuW9WB
xl8ZyrMNLqMvHJke0AGbPOWfWLxVOX7eLIby1YJxvOiZeL4DtTXW0qLM51MF
JnVQ3u0oLbq0TwpkMc0msANfuyYmOWsZyr8D+mz1h+uDGNjaRTJovvR9tmwm
SzxYvN+4ufhaZTv5YfEsMT1rRk078WHR+3TbbJVGS/5Y6Pv86mvOtBMvDu+e
2H7AO7md/HJIeLRsbGEtQ/w49KU5dE8etvvnIcX6yu+l88STx9o1OQs6HnKU
B4+Y858rVVqO+Orw0+wrDduiecpHh5rSaL/3tumItw6/Bf4RNSFYR3kJsETv
V2YG2PmP7PmcrfHP5+koPwE9S+WVoTKR9kFEW0vAgMtBPeUpYsXDpeufZ4i0
HyIUTPqkcslA+epx1uHyuop6A+2LHnFLZHzRK0bKW4+bJyfvk12zn3cJ4/fv
9ezKNlP+Egra5vyY7/iM9knCyg/KY4RdFuJhgLnYs8gvw0Q8DJh5ZMPYcXNM
xMOAiovBum9aDMTDAFk1f8JbpScenZjuWBYx+JL9/HYiqmZ3r6KZIx6d8Phi
Vs64HpZ4GPH3jdEbfYdYZNp4GDF3x+YxCRJLPIz4IbV6od9l+3kb0ZEnrxI6
BeJhwtTI39O9LHYeJqSaTotcgUA8uhDU8FWVuEMgHl1wL4rV9e/XE48uhJV6
7FyTpice3XCLl7ekONp5dOPglqlHL71oJB7dSLnwZpjTMiPxMIOdkt84htUT
DzN2sVkvV3aJxMOM795q35J8XCQeTxDw0DmvbFAgHk+Qmer0uNFFIB5PMNXt
cFLzdT3s742B8hLv1xaY8C8yWysH
      "]]}, 
    {RGBColor[0.6, 0.24, 0.5632658430022722], LineBox[CompressedData["
1:eJxVlXlQVAUcx9HAEpsAxaNIAY+EkckcOXRQv5mAHIpCziAIHqVgaBy2ipEH
Egx4AYoXFBvmSmIEhTCAR4rAILiSQLiIvN333i57vF2OxMUZKYpdf/tHv5k3
b971/f2+389v5rl+lhi+a6KVldWu8cN0/n8N4RvH8rVcagY6d3fUtX+op+tz
WPyD+4SsFAG1czL1YbVilL71+cXgWZbnEkRFP/EtLTegsMBUpagMbJKdFQ3R
++U4FiL5tybeAEOY6c5v6MpiAnwbBPq+ClU/encdDdbDVnYlaaVtDZiM3O2L
QgXSq4OTwxcu75wX4B6de9/odhtLt9all+3Uk/7v8Lh5wjap1gDJ+NeyK/dw
Y1pgfH6JQP3q8dVwfWi/hw5LzdWAq+KNzefzLPM3Qlg5K9JBGESD0W28QxM2
XvtElJbaT/M0Y6r4flmB9yDCzQ0fwMdOc9AzqJ/ma8GsBUUpS1oN4FJNgq1w
nBQTvz9GTfNKkR97JNamW41k03hJj/B46VR11XY1zd8GlwmrQzblqPGaw2No
PTNtSxLU5OcxQvz91VMuahBobtCOu4fTRUaVhvy1I2ri6N6HJ7QwdYvO7UBY
QolvnEhDfjsxbb5/yOoyFcx2ZJ2YMDijzm+Givz/CeZc7JlJWhbOpnHmdCHp
uUf4l8MKyqMLh07cdA5PYxEXa6oncAkUCj56g6N8ZIi5Wh2/YZsSJjXHchmS
M2uMkgwV5dWNiL09K9ZMVmLEJGfsxsEDV1csO6+i/J7CbeGGgEIpj1VmwR5o
iy5sbx1RU5494P+ZkqMz6GAeL/MZbsULGd9vtOxDL5wkfr4H+D48kpqqFz5x
vkWJR3nKm4HN11m/PBPzmG4eUI72vOjNt9crKH85mHyvOxJ/Dma5aAUitqyq
3lHPEw8WQd8mPSx2sPhhYScv3qRaqCQ+LOrCbVpki3jyx6LSx2Yg4DpLvDhU
HC+64jCPJb8cutfJf/1pjCV+HPZIOj3XtsnJP487Lwvqn+ewxJPHmzq3Ux+M
672W43FE1zx8JJ8lvko05q/O5gbllI8SbVHeIk8vJfFWosOfaQ6OUFJeKpyM
LOgSn+aJvwqte3ePHb7IUX4qTA9rs46ssOxDH2Kt0j121rCUZx/G4S6Zu6aX
9qMPn94N3VcX8YzyVeOv0y1p1UIP7YsaofOdk2+I5ZS3GjGuUc5OWQraHw2+
21+44e9ilvLXICRx26YXhTztkwZJ2dKRa+9aeGihTzg5lDLGEw8tLnM7tjqu
t/DQIsY6Qu9uryIeWrjrvbZ0XOeIhw6qyx5FYXFK4qHDgsWx86pm8sRDh6iP
X6XY7+OIh4B7rueiH7xgkGfmIUA65jFqPN5LPAQkHuIOMS49xEOPmT/vWXfL
vpd46DH3jLv1i6qnxEOPFvvEmOHZPcTDgISKt49JGYZ4GBB8bDY3eQ1DPAz4
oyZ5wOklQzz64Xmpsdx1s4VHPzqfl8xb3sQSj34Ei2yH37dSEI8BvCeSnlKU
McRjADKnS3OCgi37PwC7spDFdzrlxGMQ2WdfLTNOVRCPQYxWxkfK7eTEY/z6
7vI+UQ4Dy3+jPd2hzC+bwX8+hCbs
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->True,
  AxesLabel->{None, None},
  AxesOrigin->{0., 0.2826448993103332},
  ImageSize->300,
  Method->{},
  PlotRange->{All, All},
  PlotRangeClipping->True,
  PlotRangePadding->{Automatic, Automatic}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[{
 StyleBox["\n", "Section",
  FontColor->GrayLevel[0]],
 StyleBox["References\n", "Section"],
 StyleBox["Heston, S. (1993) 'A closed-form solution for options with \
stochastic volatility', Review of Financial Studies, \t6, 327-43.\n\n\"The \
Heston Model of Stochastic Volatility: Fast Option Pricing and Accurate \
Calibration.\" FinCad. Web. 13 \tDecember 2013. \
<http://www.fincad.com/derivatives-resources/articles/heston-model-stochastic-\
\t\tvolatility.aspx#ref3>. \n\nFollowed Examples on ", "Text",
  FontColor->GrayLevel[0]],
 StyleBox["Mathematica", "Text",
  FontSlant->"Italic",
  FontColor->GrayLevel[0]],
 StyleBox[" Tutorials as well to understand how these models are implemented \
and what is happening.\n", "Text",
  FontColor->GrayLevel[0]]
}], "Title", "PluginEmbeddedContent"],

Cell[BoxData[""], "Input", "PluginEmbeddedContent"]
}, Open  ]]
},
WindowSize->{1678.5166666666667`, 4050.},
Visible->True,
AuthoredSize->{1678.5166666666667`, 4050.},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"9.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (January 25, \
2013)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1485, 35, 3920, 103, 642, "Title"],
Cell[5408, 140, 620, 12, 52, "Title"],
Cell[6031, 154, 3637, 104, 174, "Code"],
Cell[9671, 260, 100, 0, 16, "Text"],
Cell[CellGroupData[{
Cell[9796, 264, 166, 4, 13, "Input"],
Cell[9965, 270, 4805, 84, 226, "Output"]
}, Open  ]],
Cell[14785, 357, 742, 12, 92, "Text"],
Cell[15530, 371, 249, 6, 13, "Input"],
Cell[15782, 379, 3529, 62, 238, "Input"],
Cell[19314, 443, 207, 4, 35, "Text"],
Cell[CellGroupData[{
Cell[19546, 451, 1237, 32, 82, "Input"],
Cell[20786, 485, 15784, 266, 238, "Output"]
}, Open  ]],
Cell[36585, 754, 374, 8, 73, "Text"],
Cell[CellGroupData[{
Cell[36984, 766, 1237, 32, 82, "Input"],
Cell[38224, 800, 29619, 495, 238, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[67880, 1300, 258, 6, 13, "Input"],
Cell[68141, 1308, 29733, 497, 237, "Output"]
}, Open  ]],
Cell[97889, 1808, 326, 7, 54, "Text"],
Cell[CellGroupData[{
Cell[98240, 1819, 1238, 32, 82, "Input"],
Cell[99481, 1853, 43336, 720, 240, "Output"]
}, Open  ]],
Cell[142832, 2576, 443, 8, 54, "Text"],
Cell[CellGroupData[{
Cell[143300, 2588, 1279, 32, 99, "Input"],
Cell[144582, 2622, 66913, 1106, 236, "Output"]
}, Open  ]],
Cell[211510, 3731, 312, 5, 16, "Text"],
Cell[211825, 3738, 1587, 51, 48, "Input"],
Cell[213415, 3791, 2448, 66, 82, "Input"],
Cell[215866, 3859, 157, 4, 35, "Text"],
Cell[CellGroupData[{
Cell[216048, 3867, 492, 12, 13, "Input"],
Cell[216543, 3881, 10352, 180, 226, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[226932, 4066, 889, 23, 31, "Input"],
Cell[227824, 4091, 10618, 186, 191, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[238491, 4283, 815, 17, 182, "Title"],
Cell[239309, 4302, 51, 0, 13, "Input"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature pvpmYQYjfnT6QDw8uJ87ffmD *)
