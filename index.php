<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">

    <title>Календарь</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="shortcut icon" href="icon.ico">
</head>

<body>
    <div class="container mt-4">
        <?php
        echo "gg<br>777";
        $CountOfDay = cal_days_in_month(CAL_GREGORIAN, date("m"), date("Y"));

        $beginMonth = mktime(0, 0, 0, date("m"), 1, date("Y"));
        $beginMonth = date('w', $beginMonth);

        ?>

        <table class="bodytable">
            <tr>
                <th>
                    <h3>Пн</h3>
                </th>
                <th>
                    <h3>Вт</h3>
                </th>
                <th>
                    <h3>Ср</h3>
                </th>
                <th>
                    <h3>Чт</h3>
                </th>
                <th>
                    <h3>Пт</h3>
                </th>
                <th>
                    <h3>Сб</h3>
                </th>
                <th>
                    <h3>Вс</h3>
                </th>
            </tr>
            <tr>
                <?php for ($day_g = 1; $day_g < $CountOfDay + $beginMonth; $day_g++) :
                    $day = $day_g - $beginMonth + 1; ?>

                    <th>
                        <?php if ($day > 0) : ?>
                            <div class="link round">
                                <a href="table.php?day=<?= $day ?>">
                                    <font color=gray><?= $day ?>
                                </a>
                            </div>
                        <?php endif; ?>
                    </th>
                    <?php if ($day_g % 7 == 0) : ?>
            </tr>
            <tr>
            <?php endif; ?>
        <?php endfor; ?>
            </tr>
        </table>
    </div>

    <div class="container mt-4">
        <h1>Добавление</h1>
        <form action="Add.php" method="post">

            <select class="form-control" name="discipline">
                <?php
                $mysql = new mysqli('sql111.epizy.com', 'epiz_31326209', 'MIWpFHj53616OIj', 'epiz_31326209_main');
                $mysql->set_charset('utf8');
                $title_sub = mysqli_query($mysql, "SELECT `title` FROM `Subjects1`");

                while ($t = $title_sub->fetch_assoc()) :
                ?>
                    <option value="<?= $t['title'] ?>"><?= $t['title'] ?></option>
                <?php
                endwhile;
                $mysql->close();
                ?>
            </select><br>

            <input type="date" class="form-control" name="date" id="date" max="2022-03-31" min="2022-03-01"><br>
            
            <input type="time" class="form-control" name="time" id="time" max="15:00" min="08:00" required><br>

            <button class=" btn btn-success" type="submit">Добавить</botton><br>
        </form>
    </div>
</body>

</html>