<html lang="ru">


<head>
    <meta charset="UTF-8">

    <title>Таблица</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container mt-4">
        <?php
        $day = $_GET["day"];
        $day1 = "$day марта 2022 года.";
        echo "<h1>$day1</h1>";
        ?>
        <table class="bodytable">

            <tr>
                <th>
                    <h3>Время экзамена</h3>
                </th>
                <th>
                    <h4>Предмет</h4>
                </th>
                <th>
                    <h4>Специальность</h4>
                </th>
            </tr>
            <?php
            
            $mysql0 = new PDO("mysql:host=sql111.epizy.com;dbname=epiz_31326209_main", 'epiz_31326209', 'MIWpFHj53616OIj',array(PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES utf8"));
            $mysql0->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            //1
            $q1 = "SELECT * FROM `Schedule1` WHERE DATE_FORMAT(`date_time`,'%d') = $day ORDER BY `date_time`";
            $statement = $mysql0->prepare($q1);
            $statement->execute();
            $result_array = $statement->fetchAll();
            $mysql0 = NULL;

            $count = 0;
            $mysql = new mysqli('sql111.epizy.com', 'epiz_31326209', 'MIWpFHj53616OIj', 'epiz_31326209_main');
            $mysql->set_charset('utf8');
            foreach ($result_array as $sh) :
                $count += 1;
                $time = $sh['date_time'];
                $id_sub = $sh['id_subject'];
                //2
                $q2 = "SELECT * FROM `Subjects1` WHERE `id`= $id_sub";
                $sub1 = mysqli_query($mysql, $q2);
                $sub = $sub1->fetch_assoc();
                $title2 = $sub['title'];
                //3
                $q3 = "SELECT * FROM `Subjects_to_specialities1` WHERE `id_subject`= $id_sub";
                $sts1 = mysqli_query($mysql, $q3);
                while ($sts = mysqli_fetch_array($sts1)) :
                    $id_spec = $sts['id_speciality'];
                    //4
                    $q4 = "SELECT * FROM `Specialities1` WHERE `id`= $id_spec";
                    $spec1 = mysqli_query($mysql, $q4);
                    $spec = $spec1->fetch_assoc();
                    $title4 = $spec['title'];
            ?>
                    <tr>
                        <th>
                            <h4><?= substr($time, 10, 6) ?></h4>
                        </th>
                        <th>
                            <h4><?= $title2 ?></h4>
                        </th>
                        <th>
                            <h4><?= $title4 ?></h4>
                        </th>
                    </tr>
            <?php
                endwhile;
            endforeach;
            $mysql->close();

            if ($count == 1) echo "<h1>Сегодня $count экзамен</h1>";
            if ($count > 1 && $count < 5) echo "<h1>Сегодня $count различных экзамена</h1>";
            if ($count > 4) echo "<h1>Сегодня $count различных экзаменов</h1>";
            ?>


        </table>
    </div>
</body>

</html>