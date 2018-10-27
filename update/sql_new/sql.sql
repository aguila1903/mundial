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

