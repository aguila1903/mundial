USE `mundialdb`;
DROP procedure IF EXISTS `spielerSpielAddBank`;

DELIMITER $$
USE `mundialdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spielerSpielAddBank`(`Var_spiel_id` INT, `Var_Spieler_id` INT, `Var_status` CHAR(2), `Var_status2` CHAR(1), `Var_aw_minute` VARCHAR(3), `Var_aw_spieler` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
-- Einwechselspieler wird in der Tabelle eingefügt
Insert into sp_spieler_spiel_tabelle
(spiel_id, spieler_id, status, status2, aw, aw_minute) 
values(Var_spiel_id, Var_Spieler_id, Var_status, Var_status2, '2', Var_aw_minute);

set Var_anzahl = ROW_COUNT();
-- Ausgewechselter Spieler wird entsprechend gekennzeichnet
if (Select status from sp_spieler_spiel_tabelle Where spieler_id = Var_aw_spieler and spiel_id = Var_spiel_id) = 'sa'
then
  update sp_spieler_spiel_tabelle
  set aw = '1', aw_minute = Var_aw_minute
  Where spieler_id = Var_aw_spieler and spiel_id = Var_spiel_id;
else
  Insert into sp_spieler_spiel_tabelle
  (spiel_id, spieler_id, status, status2, aw, aw_minute) 
  values(Var_spiel_id, Var_aw_spieler, Var_status, Var_status2, '1', Var_aw_minute);
end if;


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END$$

DELIMITER ;


USE `mundialdb`;
DROP PROCEDURE IF EXISTS `ausgabenADD`;
DROP PROCEDURE IF EXISTS `ausgabenDS`;
DROP PROCEDURE IF EXISTS `ausgabenDetailsDS`;
DROP PROCEDURE IF EXISTS `borcAdd`;
DROP PROCEDURE IF EXISTS `borcEdit`;
DROP PROCEDURE IF EXISTS `copyEinAusgabe`;
DROP PROCEDURE IF EXISTS `deleteEinAusgabe`;
DROP PROCEDURE IF EXISTS `einAusgabeAdd`;
DROP PROCEDURE IF EXISTS `einAusgabeEdit`;
DROP PROCEDURE IF EXISTS `einJahresPrognose`;
DROP PROCEDURE IF EXISTS `einJahresPrognose2`;
DROP PROCEDURE IF EXISTS `EinnahmenAusgabenPie`;
DROP PROCEDURE IF EXISTS `externKorrektur`;
DROP PROCEDURE IF EXISTS `grafik_Einnahmen_Ausgaben`;
DROP PROCEDURE IF EXISTS `findID_Almanya`;
DROP PROCEDURE IF EXISTS `monateAusgabenDS`;
DROP PROCEDURE IF EXISTS `monateDS`;
DROP PROCEDURE IF EXISTS `PDF_Almanya_Upload`;
DROP PROCEDURE IF EXISTS `PDF_Ausgaben_Upload`;
DROP PROCEDURE IF EXISTS `PDF_Upload`;
DROP PROCEDURE IF EXISTS `removeAusgaben`;
DROP PROCEDURE IF EXISTS `removeBorclar`;
DROP PROCEDURE IF EXISTS `removeTaksitler`;
DROP PROCEDURE IF EXISTS `removeTaksitlerAlmanya`;
DROP PROCEDURE IF EXISTS `spSummenRechner`;
DROP PROCEDURE IF EXISTS `taksitADD`;
DROP PROCEDURE IF EXISTS `taksitAlmanyaADD`;
DROP PROCEDURE IF EXISTS `taksitAlmanyaEdit`;
DROP PROCEDURE IF EXISTS `taksitEdit`;
DROP PROCEDURE IF EXISTS `taksitlerAlmanyaDS`;
DROP PROCEDURE IF EXISTS `taksitlerAlmanyaDS_all`;
DROP PROCEDURE IF EXISTS `taksitlerAlmanyaPie`;
DROP PROCEDURE IF EXISTS `taksitlerDS`;
DROP PROCEDURE IF EXISTS `taksitlerDS_all`;
DROP PROCEDURE IF EXISTS `taksitlerDS_all_cart`;
DROP PROCEDURE IF EXISTS `taksitlerDS_cart`;
DROP PROCEDURE IF EXISTS `taksitler_down`;
DROP PROCEDURE IF EXISTS `taksitler_up`;
DROP PROCEDURE IF EXISTS `uebersichtDS`;
DROP PROCEDURE IF EXISTS `uebersichtDS2`;
DROP TABLE IF EXISTS  `einausgaben`; 
DROP TABLE IF EXISTS  `karten`;
DROP TABLE IF EXISTS  `monats_ausgaben`;
DROP TABLE IF EXISTS  `prognosedaten`;
DROP TABLE IF EXISTS  `taksitler`;
DROP TABLE IF EXISTS  `taksitler_almanya`;
DROP TABLE IF EXISTS  `uebersicht`;
DROP TABLE IF EXISTS  `wechselkurse`;


