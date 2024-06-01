class Database {
  static const String database = 'http://192.168.160.1/examoverflow';
  static const String actions = '$database/actions';
  // these are the file we are gonna be using for connection

  static const String log_in = '$actions/log_in.php';
  static const String load_material = '$actions/load_material.php';

  // This is are Database Connection errors
  static Map<int, String> errors_and_message = {
    100: "There has been a SQL error, try again!",
    101: "No Such User, please try again!",
    102: "Server is down, please try again!",
    103: "Insert appropriate inputs !",
    104: "Check your inputs please!"
  };

  /**
   * This is what the php code look like
   * $DATABASE_ERROR = 100;//this happens when the database sql having problem
    $STUDENT_NOT_FOUND_ERROR = 101; // this happends when STUDENT is not found
    $CONNECTION_ERROR = 102; // this happens when database is not connecting
    $NO_POST_REQUESTED = 103; // This happens when flutter request is not being post
    $UNSET_VARIABLE = 104; // this happens when the post value are not being set
   */
}
