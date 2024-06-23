class Database {
  static const String database = 'http://172.26.112.1:80/examoverflow';
  static const String actions = '$database/actions';
  // these are the file we are gonna be using for connection

  static const String log_in = '$actions/log_in.php';
  static const String load_material = '$actions/load_material.php';
  static const String load_exam = '$actions/load_exam.php';
  static const String sign_up = '$actions/sign_up.php';
  static const String upload_question = '$actions/question.php';
  static const String load_question = '$actions/load_question.php';
  static const String load_answers = "$actions/load_answers.php";
  static const String give_answer = "$actions/give_answer.php";
  // This is are Database Connection errors
  static Map<int, String> errors_and_message = {
    100: "There has been a SQL error, try again!",
    101: "No Such User, please try again!",
    102: "Server is down, please try again!",
    103: "Insert appropriate inputs !",
    104: "Check your inputs please!",
    105: "Email already exist !",
    106: "Connection Problem",
    107: "Make sure you logged in!"
  };

  static int CONNECTION_PROBLEM = 106;
  static int CANNOT_FOUND_USER = 107;
  /**
   * This is what the php code look like
   * $DATABASE_ERROR = 100;//this happens when the database sql having problem
    $STUDENT_NOT_FOUND_ERROR = 101; // this happends when STUDENT is not found
    $CONNECTION_ERROR = 102; // this happens when database is not connecting
    $NO_POST_REQUESTED = 103; // This happens when flutter request is not being post
    $UNSET_VARIABLE = 104; // this happens when the post value are not being set
   */
}
