; NCL script
; functions_latlon.ncl
; Johan Liakka, Dec 2017
;******************************************************************
 
function get_o2 (inptr:file) 
begin
   if (isfilevar(inptr,"o2lvl")) then
      tmp = inptr->o2lvl
      if (typeof(tmp).eq."double") then
         xvar = dble2flt(tmp)
      else
         xvar = tmp
      end if
      xvar = (/xvar*1.0e+3/)
      xvar@long_name = "Oxygen"
      xvar@units = "mmol m-3"
      assignFillValue(xvar,xvar)
   else
      print("get_o2: no o2lvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end

function get_aou (inptr:file) 
begin
   if (isfilevar(inptr,"o2lvl").and.isfilevar(inptr,"p_o2lvl")) then
      tmp = inptr->o2lvl
      if (typeof(tmp).eq."double") then
         xvar1 = dble2flt(tmp)
      else
         xvar1 = tmp
      end if
      delete(tmp)
      tmp = inptr->p_o2lvl
      if (typeof(tmp).eq."double") then
         xvar2 = dble2flt(tmp)
      else
         xvar2 = tmp
      end if
      xvar = xvar2-xvar1
      copy_VarCoords(xvar1,xvar)
      xvar = (/xvar*1.0e+3/)
      xvar@long_name = "AOU"
      xvar@units = "mmol m-3"
      assignFillValue(xvar,xvar)
   else
      print("get_aou: no o2lvl/p_o2lvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end

function get_si (inptr:file)
begin
   if (isfilevar(inptr,"silvl")) then
      tmp = inptr->silvl
      if (typeof(tmp).eq."double") then
         xvar = dble2flt(tmp)
      else
         xvar = tmp
      end if
      xvar = (/xvar*1.0e+3/)
      xvar@long_name = "Silicate"
      xvar@units = "mmol m-3"
      assignFillValue(xvar,xvar)
   else
      print("get_si: no silvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end

function get_po4 (inptr:file)
begin
   if (isfilevar(inptr,"po4lvl")) then
      tmp = inptr->po4lvl
      if (typeof(tmp).eq."double") then
         xvar = dble2flt(tmp)
      else
         xvar = tmp
      end if
      xvar = (/xvar*1.0e+3/)
      xvar@long_name = "Phosphate"
      xvar@units = "mmol m-3"
      assignFillValue(xvar,xvar)
   else
      print("get_po4: no po4lvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end

function get_no3 (inptr:file)
begin
   if (isfilevar(inptr,"no3lvl")) then
      tmp = inptr->no3lvl
      if (typeof(tmp).eq."double") then
         xvar = dble2flt(tmp)
      else
         xvar = tmp
      end if
      xvar = (/xvar*1.0e+3/)
      xvar@long_name = "Nitrate"
      xvar@units = "mmol m-3"
      assignFillValue(xvar,xvar)
   else
      print("get_no3: no no3lvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end

function get_dissic (inptr:file)
begin
   if (isfilevar(inptr,"dissiclvl")) then
      tmp = inptr->dissiclvl
      if (typeof(tmp).eq."double") then
         xvar = dble2flt(tmp)
      else
         xvar = tmp
      end if
      xvar@long_name = "DIC"
      xvar@units = "mol m-3"
      assignFillValue(xvar,xvar)
   else
      print("get_dissic: no dissiclvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end

function get_talk (inptr:file)
begin
   if (isfilevar(inptr,"talklvl")) then
      tmp = inptr->talklvl
      if (typeof(tmp).eq."double") then
         xvar = dble2flt(tmp)
      else
         xvar = tmp
      end if
      xvar@long_name = "TAlk"
      xvar@units = "mol m-3"
      assignFillValue(xvar,xvar)
   else
      print("get_talk: no talklvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end

function get_delta13c (inptr:file)
begin
   if (isfilevar(inptr,"delta13clvl")) then
      tmp = inptr->delta13clvl
      if (typeof(tmp).eq."double") then
         xvar = dble2flt(tmp)
      else
         xvar = tmp
      end if
      xvar@long_name = "delta13C"
      xvar@units = "permil"
      assignFillValue(xvar,xvar)
   else
      print("get_delta13c: no delta13clvl variable present")
      xvar = -999.0
   end if
   return (xvar)
end
