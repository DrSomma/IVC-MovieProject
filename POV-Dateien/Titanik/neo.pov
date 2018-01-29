#declare torso= union{  // Oberkörper bestehend aus
    difference {
        intersection {  // Schnitt von Kegel und Box als Grundkörper
            cone {<0,9,0>, 1.8, <0,16.9,0>, 2.3}
            difference {
                box {<-5,8.9,-1>, <5, 15.68, 1>} 
                cylinder {<-2.2,15.5,0>, <0,16,0>,1.00}  //Ausschneiden der Schultern für weniger Glitches
                cylinder {<0,16,0>, <2.2,15.5,0>,1.00}   
            }                            
        }
        union {box {<-1.5,-1.5,-1.1>,<1.5,1.5,-0.9>} rotate <0,0,45> translate <0,8.3,0>} // Karo-Einschnitt unten am Mantel
        box {<-1.5,8.9,-0.95>,<1.5,10,0>}   // Ausschnitt für die Hüfte dahinter
        box {<-0.3,9,-1.1>,<-0.2,16,-0.9>}  // Einschnitt neben der Knopfreihe
    }
    
    cylinder {<-1.6,10,0>,<1.6,10,0>,0.9} // Hüfte
    sphere {<0,11,-1>,0.07} // Mantelknöpfe
    sphere {<0,12,-1>,0.07}
    sphere {<0,12,-1>,0.07}
    sphere {<0,13,-1>,0.07}  
    sphere {<0,14,-1>,0.07}
    sphere {<0,15,-1>,0.07}
    sphere {<0,16,-1>,0.07}
    
    difference { // Schulter-Zylinder
        union {
            cylinder {<-2.2,15.5,0>, <0,16,0>,1}
            cylinder {<0,16,0>, <2.2,15.5,0>,1}
        } 
        box{<-0.3,9,-1.1>,<-0.2,16.5,-0.9>} // Einschnitt neben Knopfreihe
    }   
    sphere {<-2.1,15.52,0>,1}  // Schulter-Kugeln
    sphere {<2.1,15.52,0>,1}
    
    difference { // Kragen als ausgehölter Kegel mit Keil-Einschnitt vorne
        cone {<0,16.2,0>,0.95,<0,17.4,0>,0.83}
        cone {<0,16.2,0>,0.9,<0,17.5,0>,0.78}
        box {<-0.05,16.1,-1.2>,<0.05,17.5,-0.5>}
        cone {<0,17,-0.95>, 0.1, <0,17.5,-0.95>, 0.30}
    }
    
    translate <0,-9,0> // Zum Rotieren auf 0,0,0 verschieben
    pigment{ rgb<0.15,0.15,0.15> }  // dunkelgrau
    }
    
#declare torso2= union{  // Bösewicht-Oberkörper ohne Kragen
    difference {
        intersection {  // Schnitt von Kegel und Box als Grundkörper
            cone {<0,9,0>, 1.8, <0,16.9,0>, 2.3}
            difference {
                box {<-5,8.9,-1>, <5, 15.68, 1>} 
                cylinder {<-2.2,15.5,0>, <0,16,0>,1.00}  //Ausschneiden der Schultern für weniger Glitches
                cylinder {<0,16,0>, <2.2,15.5,0>,1.00}   
            }                            
        }
        union {box {<-1.5,-1.5,-1.1>,<1.5,1.5,-0.9>} rotate <0,0,45> translate <0,8.3,0>} // Karo-Einschnitt unten am Mantel
        box {<-1.5,8.9,-0.95>,<1.5,10,0>}   // Ausschnitt für die Hüfte dahinter
        box{<-0.6,9,-1.5>,<0.6,16.5,-0.9>} // Hemd-Einschnitt
    }
    
    cylinder {<-1.6,10,0>,<1.6,10,0>,0.9} // Hüfte
      difference { // Schulter-Zylinder
            union {
                cylinder {<-2.2,15.5,0>, <0,16,0>,1}
                cylinder {<0,16,0>, <2.2,15.5,0>,1}
        } 
        box{<-0.6,9,-1.5>,<0.6,16.5,-0.9>} // Hemd-Einschnitt
    }
    difference { // weißes Hemd
        box{<-0.6,9,-1.0>,<0.6,16.4,-0.9> }
        sphere {<0,16.8,-0.95>,0.9}
        pigment {rgb <1,1,1>} finish {ambient 0.5}
    }
    difference { // Krawatten-Knoten
        sphere {<0,16.1,-0.8>, 0.4}
        box {<-1.1,16.4,-2>,<1.1,17.3,25>}
        }
    cone {<0,15.9,-1>,0.1,<0,11,-0.25>,0.8}   
    sphere {<-2.1,15.52,0>,1}  // Schulter-Kugeln
    sphere {<2.1,15.52,0>,1}
    translate <0,-9,0> // Zum Rotieren auf 0,0,0 verschieben
    pigment{ rgb<0.15,0.15,0.15> }  // dunkelgrau
    }

                            
#declare cloak = difference { // Mantel als halber, ausgehöhlter, nach hinten rotierter Kegel
        cone {<0,10,0>,1.8,<0,2.5,0>,2.8}
        box{<-3.1,2.4,-3.1>,<3.1,10.1,-1>} // halbieren
        intersection { // aushöhlen
            cone {<0,10.1,0>,1.7,<0,2.4,0>,2.7}
            box {<-3,2.3,-1.1>,<3,10.2,3>}
        } 
    rotate <-10,0,0> translate <0,-.6,1.71> // nach hinten drehen
    translate  <0,-10,0> // 
    pigment{ rgb<0.15,0.15,0.15> } // dunkelgrau
    }
    
    
#declare sunglass = union { 
    intersection { // flacher Schnitt durch Zylinder mit Kugeln an beiden Enden (Tic-Tac)
        union {
            sphere {<-0.15,0,0>,0.2}
            sphere {<0.15,0,0>,0.2}
            cylinder {<-0.15,0,0>,<0.15,0,0>,0.2}
        }
        box {<-0.6,-0.3,-0.02>,<0.6,0.3,0.02>} // flacher Schnitt
    }
    rotate <0,0,0>
    pigment{ rgb<0.15,0.15,0.15> } finish {specular  0.8} // dunkelgrau glänzend
    }
    
#declare sunglass2 = union { // Eckiger für Bösewicht
    intersection { // flacher Schnitt durch Zylinder mit Kugeln an beiden Enden (Tic-Tac)
        cylinder {<0,0,-0.03>,<0,0,0.03>,0.25}
        box {<-0.25,-0.2,-0.02>,<0.25,0.2,0.02>} // flacher Schnitt
    }
    rotate <0,0,0>
    pigment{ rgb<0.15,0.15,0.15> } finish {specular  0.8} // dunkelgrau glänzend
}



#declare port = difference { // Steckerbuchse im Nacken
    cylinder {<0,0,-0.1>,<0,0,0.1>,0.15} // Außenring
    difference { // Ring innen ausschneiden
        cylinder {<0,0,0>,<0,0,0.11>,0.12}
        cylinder {<0,0,-0.01>,<0,0,0.12>,0.08}
    }    
    cylinder {<0,0,-0.11>,<0,0,0.11>0.04} // Loch in der Mitte
    pigment{ rgb<0.35,0.35,0.35>} finish {ambient 0.5 diffuse 0.8 specular 0.8 reflection 1}  // Metall
}            


#declare head = union { // Kopf bestehend aus

    cylinder {<0,16.9,0>,<0,18.0,0> 0.7} // Hals
    
    sphere {<0,18.4,0>, 0.95}  // Kopf aus Zylinder mit Kugeln an beiden Enden
    cylinder{<0,18.4,0>,<0,19.5,0>, 0.95}
    sphere{<0,19.5,0>,0.95}
    
    intersection { // Frisur als Querschnitt von Kugel+Zylinder und Schnittmaske
        union { // Kugel+Zylinder
            sphere{<0,19.8,0>,1.0}
            cylinder{<0,18.2,0>,<0,19.8,0>, 1.0}
        }
        union { // Schnittmaske 
            difference {
                box {<-1.2,18.0,-0.6>,<1.2,20.8,1.2>}
                sphere {<0,18,-1>, 1.9}
            }    
            cylinder {<0,19,-0.5>,<0,20.9,-0.5>, 0.2}
        }
        pigment{ rgb<0.15,0.15,0.15> }  // dunkelgrau
        }
    object { sunglass rotate <0,-20,15> translate <0.4,19.1,-0.95> } // Sonnenbrille links
    object { sunglass rotate <0,20,-15> translate <-0.4,19.1,-0.95> } // Sonnenbrille rechts   
    object { port rotate <10,0,0> translate <0,17.77,0.7> }
    translate <0,-16.9,0>
    pigment{ rgb<1.2,0.9,0.7> }  // Hautfarbe 
}

#declare head2 = union { // Kopf ohne Port

    cylinder {<0,16.9,0>,<0,18.0,0> 0.7} // Hals
    
    sphere {<0,18.4,0>, 0.95}  // Kopf aus Zylinder mit Kugeln an beiden Enden
    cylinder{<0,18.4,0>,<0,19.5,0>, 0.95}
    sphere{<0,19.5,0>,0.95}
    
    intersection { // Frisur als Querschnitt von Kugel+Zylinder und Schnittmaske
        union { // Kugel+Zylinder
            sphere{<0,19.8,0>,1.0}
            cylinder{<0,18.2,0>,<0,19.8,0>, 1.0}
        }
        union { // Schnittmaske 
            difference {
                box {<-1.2,18.0,-0.6>,<1.2,20.8,1.2>}
                sphere {<0,18,-1>, 1.9}
            }    
            cylinder {<0,19,-0.5>,<0,20.9,-0.5>, 0.2}
        }
        pigment{ rgb<0.15,0.15,0.15> }  // dunkelgrau
        }
    object { sunglass rotate <0,-20,15> translate <0.4,19.1,-0.95> } // Sonnenbrille links
    object { sunglass rotate <0,20,-15> translate <-0.4,19.1,-0.95> } // Sonnenbrille rechts
    translate <0,-16.9,0>
    pigment{ rgb<1.2,0.9,0.7> }  // Hautfarbe 
}

#declare head3 = union { // Bösewicht-Kopf mit anderer Frisur und Headset

    cylinder {<0,16.9,0>,<0,18.0,0> 0.7} // Hals
    
    sphere {<0,18.4,0>, 0.95}  // Kopf aus Zylinder mit Kugeln an beiden Enden
    cylinder{<0,18.4,0>,<0,19.5,0>, 0.95}
    sphere{<0,19.5,0>,0.95}
    
    intersection { // Frisur als Querschnitt von Kugel+Zylinder und Schnittmaske
        union { // Kugel+Zylinder
            sphere{<0,19.8,0>,1.0}
            cylinder{<0,18.2,0>,<0,19.8,0>, 1.0}
        }
        union { // Schnittmaske 
            difference {
                box {<-1.2,18.0,-0.6>,<1.2,20.8,1.2>}
                sphere {<0,17.6,-1>, 1.8}
            }    
           
        }
        pigment{ rgb<0.55,0.55,0.35> }  // dunkelgrau
        }
    object { sunglass2 rotate <0,-20,0> translate <0.3,19.1,-0.95> } // Sonnenbrille links
    object { sunglass2 rotate <0,20,0> translate <-0.3,19.1,-0.95> } // Sonnenbrille rechts
    translate <0,-16.9,0>
    pigment{ rgb<1.2,0.9,0.7> }  // Hautfarbe 
}



#declare upper_arm= union{ // Oberarm als Zylinder an Schulter mit Kugel unten
    cone {<0,15.5,0>,0.8,<0,13,0>,0.5}
    sphere {<0,13,0>,0.5}
    translate <0,-15.5,0>
    pigment{ rgb<0.15,0.15,0.15> }  // dunkelgrau
    }


#declare fore_arm = union { // Unterarm als Zylinder an Oberarm
    cone{<0,13,0>,0.5 <0,10,0>,0.35}
    translate <0,-13,0>
    pigment{ rgb<0.15,0.15,0.15> } // dunkelgrau
    }

    
#declare hand = difference { // Hand als ausgehöhlter Zylinder mit Box-Einschnitt, 2te Hand muss gedreht werden
    cylinder {<0,9.6,-0.3>,<0,9.6,0.3>,0.4}
    cylinder {<0,9.6,-0.6>,<0,9.6,0.6>,0.3}
    box {<-0.5,9.0,-0.6>,<0,9.5,0.6>}
    translate <0,-9.9,0>
    pigment{ rgb<1.3,1,0.8> } // Hautfarbe
    }

    
#declare quad = union { // Oberschenkel als Zylinder an Hüft-Zylinder mit Kugel oben
   sphere {<0,9,0>,0.85}
   cone {<0,9,0>,0.85,<0,4.5,0>,0.75}
   translate <0,-9,0>
   pigment{ rgb<0.15,0.15,0.15> } // dunkelgrau
   }
 
   
#declare calf = union { // Unterschenkel als Zylinder an Oberschenkel mit Kugel oben
   sphere {<0,4.5,0>,0.75}
   cone {<0,4.5,0>,0.75,<0,1,0>,0.6}
   translate <0,-4.5,0>
   pigment{ rgb<0.15,0.15,0.15> }  // dunkelgrau
   } 


#declare foot = union { // Fuß als unten abgeschnittener Zylinder+Kegel
    cylinder {<0,0.3,0.4>, <0,1,0.4>, 0.5}
    box {<-0.5,0.3,-0.5>,<0.5,1,0.5>}
    intersection {
        cone {<0,0.3,-1.9>, 0.25, <0,0.3,-0.25>, 1}
        box {<-0.51,0.3,-2>,<0.51,1.3,-0.5>}
    }
    translate <0,-1,0>
    pigment{ rgb<0.15,0.15,0.15> } // dunkelgrau
    }

    
#macro Odd(a) // Für Schritt-Zyklus im geraden & ungeraden Zeitschritt
  #local o = true;
  #local i = int(a)/2;
  #if ( i = (int(i)) ) 
    #local o = false;
  #end
  o 
#end







        