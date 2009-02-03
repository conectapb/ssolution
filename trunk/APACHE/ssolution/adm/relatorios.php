<?
define('ROOT','../');
require(ROOT . 'configs.php');
?>

<script language="javascript" src="../templates/js/jquery.js"></script>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=<?=$gmaps_key?>" type="text/javascript"></script>

<script type="text/javascript">
    var map;
    var mapControl;

    function load() {
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map"));
        //map.setCenter(new GLatLng(37.4419, -122.1419), 13);

        mapControl = new GMapTypeControl();
        map.addControl(mapControl);
        map.addControl(new GSmallMapControl());

      }
    }

    function mapAddress(nome,endereco,numero,cidade,uf)
    {
        var geocoder = new GClientGeocoder();
        var address = endereco + "," + numero + "," + cidade + "," + uf;
        //alert(address);
        geocoder.getLatLng(
            address,
            function(point) {
                if (!point) {
                    alert(address + " azucrinado! x(");
                } else {
                    map.setCenter(point, 15);
                    var marker = new GMarker(point);
                    GEvent.addListener(marker, "click", function() {
                        marker.openInfoWindowHtml(nome + "<br>" + address);
                    });

                    map.addOverlay(marker);
                    marker.openInfoWindowHtml(address);
                }
            }
        );
    }

    $(document).ready(function() {
        load();
    
<?$res = bdQuery("SELECT nome,concat(endereco,',',numero,',',cidade,',',uf) as address, endereco, numero, cidade, uf
FROM clientes WHERE tipo='Pessoa física' AND endereco<>'' AND numero<>'' AND cidade<>'' AND uf<>''
GROUP BY address",$conexao);
while($tmp = mysql_fetch_assoc($res)){
    if($tmp['address']!=$address_prev){ $address_prev=$tmp['address'];?>
        mapAddress("<?=$tmp['nome']?>","<?=$tmp['endereco']?>","<?=$tmp['numero']?>","<?=$tmp['cidade']?>","<?=$tmp['uf']?>");
<? } } ?>
});
</script>

<br>
<br>
<br>

<div id="map" style="width:300px; height:300px;"></div>