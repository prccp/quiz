<?php

// Captura ID do questionário na URL
$quiz_id = filter_input(INPUT_GET, 'quiz', FILTER_SANITIZE_NUMBER_INT);

// Conecta ao banco de dados utilizando PDO
$pdo = new PDO('mysql:host=localhost;dbname=quizzes;charset=utf8', 'root');

// Query para trazer informações sobre o questionário
$stmt = $pdo->prepare('SELECT t.id, t.name, t.description, c.name as category, t.basePoints, t.startDate, t.endDate, t.isActive, t.alreadyAnswered FROM quiz AS t LEFT JOIN category AS c ON (t.category = c.id) WHERE t.id=:quiz_id');
$stmt->bindValue(':quiz_id', $quiz_id);
$stmt->execute();
$array = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Query para trazer informações das perguntas do questionário
$stmt = $pdo->prepare('SELECT id, text, type FROM questions WHERE quiz_id=:quiz_id');
$stmt->bindValue(':quiz_id', $quiz_id);
$stmt->execute();
foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
    // Insere questões do questionário ao array
    $array[0]['questions'][] = $row;
    // Query para trazer informações das opções de cada pergunta do questionário
    $stmt = $pdo->prepare('SELECT id, text, value FROM options WHERE quiz_id=1 AND question_id=:question_id');
    $stmt->bindValue(':question_id', $row["id"]);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($result as $option) {
        // Insere opções de cada questão
        $array[0]['questions'][count($array[0]['questions'])-1]['options'][] = $option;
    }
}
// Ajusta encode e prepara array para envio
$data = array('data' => mb_convert_encoding($array,"UTF-8","auto"));

//Envia JSON
echo json_encode($data, JSON_UNESCAPED_UNICODE);

// Encerra conexão com banco
$pdo = null;