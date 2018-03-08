<?php
$first_name = auth()->user()->first_name;
$last_name = auth()->user()->last_name;
$full_name =  $first_name . ' ' . $last_name;
?>
<p style="padding: 20px;">
    Hallo {{ $full_name }}<br>
    Vielen Dank für deinen Einkauf. Im Anhang erhältst du den Rechnungsbeleg.<br>
</p>
<p style="padding: 20px;">
    Freundliche Grüsse
</p>
<p style="padding: 20px;">
    Dein Kaffemaschinen-Team<br><br>
    Brock GmbH - Birmensdorferstrasse 430 - CH-8055 Zürich<br>
    Tel. +41 (0) 44 450 21 02 - <a href="mailto:shop@kaffemaschinen.ch">shop@kaffemaschinen.ch</a> - <a href="http://kaffemaschinen.ch/" target="_blank">www.kaffemaschinen.ch</a><br>
    MwSt-Nr. CHE-115.174.365<br><br>
    kaffemaschinen.ch<br>
</p>





