{literal}
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAUAecZaIhJ9pt2EiErpgo1BRoevPfaekpj5ExUy4Pkbymj8J2mhRS9iuKesMyF9Iaric0Lc-nHHpjQg" type="text/javascript"></script>

<script type="text/javascript">
    function mapa()
    {
        if (GBrowserIsCompatible()) {
            alert("map");
            var map = new GMap2(document.getElementById("map"));
            map.setCenter(new GLatLng(37.4419, -122.1419), 13);
        }
    }
    
</script>

<div id="map" style="width:300px; height:300px;">
{/literal}