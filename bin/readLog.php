#!/usr/bin/env php
<?php
date_default_timezone_set('Europe/Paris');
/**
* readLog.php
*/

$WEBHOST = 'snapshots.computervision.local';
$oParseLog = new ParseLog($WEBHOST);


while($f = fgets(STDIN)){

    $time = date("H");
    if ($time >= 7 and $time <= 20) {
        $oParseLog->setLogLine($f);
    }
}

class ParseLog
{
    protected $webhost;
    protected $readnext = false;
    public function __construct($webhost)
    {
        $this->webhost = $webhost;
    }

    public function setLogLine($line)
    {
        if (FALSE !== strpos($line, 'ALERTE')) {
            echo "$line";
            $this->readnext = true;
            $this->alert();
        } elseif ($this->readnext) {
            echo "$line";
            $this->readnext = false;
        }
    }

    protected function alert()
    {
        $command = "ssh {$this->webhost} /home/jody/bin/recordalert.sh";
        echo $command;
        exec($command);
    }
}