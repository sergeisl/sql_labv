<?php

try{
	$db = new PDO('mysql:host=localhost;dbname=labv','root','');
}
catch(PDOException $e){
	echo 'Error : '.$e->getMessage();
	exit();
}
 
$stmt = $db->prepare("INSERT INTO info (id,N_CH) VALUES (:id,:N_CH)");
$stmt->bindParam(':id', $info_id);
$stmt->bindParam(':N_CH', $N_CH);
$stmt1 = $db->prepare("INSERT INTO Channel_Desc (id,id_Info,channel_Num,channel_Name) VALUES (:id,:id_Info,:channel_Num,:channel_Name)");
$stmt1->bindParam(':id', $Channel_Desc_id);
$stmt1->bindParam(':id_Info', $id_Info);
$stmt1->bindParam(':channel_Num', $channel_Num);
$stmt1->bindParam(':channel_Name', $channel_Name);
$stmt2 = $db->prepare("INSERT INTO Channel_Val (value,id_Channel) VALUES (:value,:id_Channel)");
$stmt2->bindParam(':value', $value);
$stmt2->bindParam(':id_Channel', $id_Channel);

for($i=1;$i<10;$i++){
	$info_id = $i;
	$N_CH = rand(5, 10);
	
	for($j=1;$j<$N_CH;$j++){
		$Channel_Desc_id++;
		$id_Info = $info_id;
		$channel_Num=10;
		$channel_Name = "channel".$j;
	
		for($k=1;$k<$channel_Num;$k++){
			$value = rand(1, 10);
			$id_Channel = $Channel_Desc_id;
			$stmt2->execute();
		}
		$stmt1->execute();
	}
	$stmt->execute();
}
?>
