using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
//Debug.WriteLine()

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [Serializable]
    public class Item
    {
        public string title { get; set; }
        public string grade { get; set; }
        public string credit { get; set; }
        public string semester { get; set; }
        public int semCode { get; set; }
    };

    public class user
    {
        public string id { get; set; }
        public string name { get; set; }
        public string major { get; set; }
        public string advisor_ID { get; set; }
        public string advisor_Name { get; set; }
        public string GPA { get; set; }
    };

    [Serializable]
    public class crn_term
    {
        public int crn { get; set; }
        public string term { get; set; }
        public string course { get; set; }
    };

    [WebMethod]
    public static List<List<Item>> GetCoursesList(user e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT * FROM NAJAAH_DEGREE_PLAN WHERE STU_MAJOR = '"+e.major+"'";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        List<List<Item>> items = new List<List<Item>>();

        List<Item> sem1 = new List<Item>();

        List<Item> sem2 = new List<Item>();

        List<Item> sem3 = new List<Item>();

        List<Item> sem4 = new List<Item>();

        List<Item> sem5 = new List<Item>();

        List<Item> sem6 = new List<Item>();

        List<Item> sem7 = new List<Item>();

        List<Item> sem8 = new List<Item>();

        List<Item> sem9 = new List<Item>();

        List<Item> sem10 = new List<Item>();

        List<Item> sem11 = new List<Item>();


        if (reader.HasRows)
        {
            var indexOfTitle = reader.GetOrdinal("CRSE_CODE");
            var indexOfCode = reader.GetOrdinal("CRSE_NUMB");
            var indexOfSemCode = reader.GetOrdinal("Semester");
            var indexOfCredit = reader.GetOrdinal("credit");

            while (reader.Read())
            {

                var Title = reader.GetValue(indexOfTitle).ToString();
                var courseCode = reader.GetValue(indexOfCode).ToString();
                var SemCode = reader.GetValue(indexOfSemCode).ToString();
                var code = Int32.Parse(SemCode);
                var cCode = Int32.Parse(courseCode);
                var cr = reader.GetValue(indexOfCredit).ToString();

                if (cCode < 0)
                {
                    Title += " XXX";
                }

                else
                {
                    Title += " " + cCode;
                }

                if (code == 1)
                {
                    sem1.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 2)
                {
                    sem2.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 3)
                {
                    sem3.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 4)
                {
                    sem4.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 5)
                {
                    sem5.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 6)
                {
                    sem6.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 7)
                {
                    sem7.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 8)
                {
                    sem8.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 9)
                {
                    sem9.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 10)
                {
                    sem10.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

                if (code == 11)
                {
                    sem11.Add(new Item()
                    {
                        title = Title,
                        semCode = code,
                        credit = cr,

                    });
                }

            }

            items.Add(sem1);
            items.Add(sem2);
            items.Add(sem3);
            items.Add(sem4);
            items.Add(sem5);
            items.Add(sem6);
            items.Add(sem7);
            items.Add(sem8);
            items.Add(sem9);
            items.Add(sem10);
            items.Add(sem11);

            myConnection.Close();

            myConnection.Open();
            query = "SELECT CRSE_CODE, FINAL_GRADE, TERM_CODE FROM VIEW_TRANSCRIPT WHERE STU_ID = '" + e.id + "'";
            cmd = new SqlCommand(query, myConnection);

            reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                var indexOfCourse = reader.GetOrdinal("CRSE_CODE");
                var indexOfGrade = reader.GetOrdinal("FINAL_GRADE");
                var indexOfTerm = reader.GetOrdinal("TERM_CODE");

                while (reader.Read())
                {

                    for (int i = 0; i < items.Count; i++)
                    {
                        for (int j = 0; j < items[i].Count; j++)
                        {
                            if ((items[i][j].title.Split(' ')[0] + "-" + items[i][j].title.Split(' ')[1]).Equals(reader.GetValue(indexOfCourse).ToString()))
                            {
                                items[i][j].grade = reader.GetValue(indexOfGrade).ToString();
                                items[i][j].semester = reader.GetValue(indexOfTerm).ToString().Substring(2, 3);
                            }
                        }
                    }

                }
            }

            myConnection.Close();
        }

        for (int i = 0; i < items.Count; i++)
        {
            // items[i] = filter(items[i]);
        }

        return items;
    }

    [WebMethod]
    public static List<Item> GetCourses(user e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT * FROM NAJAAH_DEGREE_PLAN WHERE STU_MAJOR = '" + e.major + "'";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        List<Item> items = new List<Item>();

        if (reader.HasRows)
        {
            var indexOfTitle = reader.GetOrdinal("CRSE_CODE");
            var indexOfCode = reader.GetOrdinal("CRSE_NUMB");
            var indexOfSemCode = reader.GetOrdinal("Semester");
            var indexOfCredit = reader.GetOrdinal("credit");

            while (reader.Read())
            {

                var Title = reader.GetValue(indexOfTitle).ToString();
                var courseCode = reader.GetValue(indexOfCode).ToString();
                var SemCode = reader.GetValue(indexOfSemCode).ToString();
                var code = Int32.Parse(SemCode);
                var cCode = Int32.Parse(courseCode);
                var cr = reader.GetValue(indexOfCredit).ToString();

                if (cCode < 0)
                {
                    Title += " XXX";
                }

                else
                {
                    Title += " " + cCode;
                }


                items.Add(new Item()
                {
                    title = Title,
                    semCode = code,
                    credit = cr,

                });

            }

        }

        myConnection.Close();

        myConnection.Open();

        query = "SELECT CRSE_CODE, FINAL_GRADE, TERM_CODE FROM VIEW_TRANSCRIPT WHERE STU_ID = '" + e.id + "'";

        cmd = new SqlCommand(query, myConnection);

        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            var indexOfCourse = reader.GetOrdinal("CRSE_CODE");
            var indexOfGrade = reader.GetOrdinal("FINAL_GRADE");
            var indexOfTerm = reader.GetOrdinal("TERM_CODE");

            while (reader.Read())
            {

                for (int i = 0; i < items.Count; i++)
                {
                    if ((items[i].title.Split(' ')[0] + "-" + items[i].title.Split(' ')[1]).Equals(reader.GetValue(indexOfCourse).ToString()))
                    {
                        items[i].grade = reader.GetValue(indexOfGrade).ToString();
                        items[i].semester = reader.GetValue(indexOfTerm).ToString().Substring(2, 3);
                    }

                }

            }
        }

        myConnection.Close();

        items = filter(items);

        return items;
    }

    [WebMethod]
    public static List<crn_term> GetTemp(user e)
    {

        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT TERM_CODE, STU_SECTION_CRN  FROM VIEW_STUDENT_SCHEDULE WHERE STUDENT_ID = '" + e.id + "'";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        List<crn_term> temp = new List<crn_term>();
        if (reader.HasRows)
        {
            var indexOfTerm = reader.GetOrdinal("TERM_CODE");
            var indexOfCrn = reader.GetOrdinal("STU_SECTION_CRN");

            while (reader.Read())
            {
                var crn = reader.GetValue(indexOfCrn).ToString();
                var term = reader.GetValue(indexOfTerm).ToString();
                crn_term t = new crn_term();
                t.crn = Int32.Parse(crn); ;
                t.term = term;
                temp.Add(t);
            }

        }
        myConnection.Close();
        List<List<Item>> Semsters = new List<List<Item>>();
        List<Item> current = new List<Item>();
        List<Item> next = new List<Item>();
        for (int i = 0; i < temp.Count; i++)
        {
            myConnection.Open();
            query = "SELECT COURSE FROM VIEW_COURSE_OFFERING_TERM WHERE TERM = @t AND CRN = @c";
            cmd = new SqlCommand(query, myConnection);
            cmd.Parameters.AddWithValue("@t", temp[i].term);
            cmd.Parameters.AddWithValue("@c", temp[i].crn);
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                var indexOfCourse = reader.GetOrdinal("COURSE");

                while (reader.Read())
                {
                    var course = reader.GetValue(indexOfCourse).ToString();
                    temp[i].course = course;
                }
            }

            myConnection.Close();
        }
        return temp;
    }

    [WebMethod]
    public static List<List<Item>> preCourses(user e)
    {

        List<Item> courses = GetCourses(e);

        List<List<Item>> preCourses = new List<List<Item>>();

        for (int i = 0; i < courses.Count; i++)
        {
            Debug.WriteLine(courses[i].title);
            preCourses.Add(preRequest(courses[i]));
        }

        Debug.WriteLine(courses.Count);

        for (int i = 0; i < preCourses.Count; i++)
        {
            for (int j = 0; j < preCourses[i].Count; j++)
            {
                Debug.WriteLine(preCourses[i][j].title);
            }

            Debug.WriteLine("New Line");
        }
        Debug.WriteLine(preCourses.Count() + "sssssssssssssssssss");
        return preCourses;
    }

    [WebMethod]
    public static List<Item> preRequest(Item i)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string name = i.title.Split(' ')[0];

        string num = i.title.Split(' ')[1];

        string query = "SELECT PREREQ_CRSE_CODE, PREREQ_CRSE_NUMB FROM VIEW_PREREQ WHERE CRSE_CODE = '" + name + "' AND CRSE_NUMB = '" + num + "'";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        List<Item> items = new List<Item>();

        items.Add(i);

        if (reader.HasRows)
        {
            var indexOfTitle = reader.GetOrdinal("PREREQ_CRSE_CODE");
            var indexOfCode = reader.GetOrdinal("PREREQ_CRSE_NUMB");

            while (reader.Read())
            {

                var Title = reader.GetValue(indexOfTitle).ToString();
                var courseCode = reader.GetValue(indexOfCode).ToString();

                Title += " " + courseCode;



                items.Add(new Item()
                {
                    title = Title,

                });

            }
        }

        myConnection.Close();

        return items;
    }

    [WebMethod]
    public static List<List<Item>> GetCoursesBySemester(user e)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT * FROM NAJAAH_DEGREE_PLAN WHERE STU_MAJOR = '" + e.major + "'";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        List<Item> items = new List<Item>();

        if (reader.HasRows)
        {
            var indexOfTitle = reader.GetOrdinal("CRSE_CODE");
            var indexOfCode = reader.GetOrdinal("CRSE_NUMB");
            var indexOfSemCode = reader.GetOrdinal("Semester");
            var indexOfCredit = reader.GetOrdinal("credit");

            while (reader.Read())
            {

                var Title = reader.GetValue(indexOfTitle).ToString();
                var courseCode = reader.GetValue(indexOfCode).ToString();
                var SemCode = reader.GetValue(indexOfSemCode).ToString();
                var code = Int32.Parse(SemCode);
                var cCode = Int32.Parse(courseCode);
                var cr = reader.GetValue(indexOfCredit).ToString();

                if (cCode < 0)
                {
                    Title += " XXX";
                }

                else
                {
                    Title += " " + cCode;
                }


                items.Add(new Item()
                {
                    title = Title,
                    semCode = code,
                    credit = cr,

                });

            }

        }

        myConnection.Close();

        myConnection.Open();

        query = "SELECT CRSE_CODE, FINAL_GRADE, TERM_CODE FROM VIEW_TRANSCRIPT WHERE STU_ID = '" + e.id + "'";

        cmd = new SqlCommand(query, myConnection);

        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            var indexOfCourse = reader.GetOrdinal("CRSE_CODE");
            var indexOfGrade = reader.GetOrdinal("FINAL_GRADE");
            var indexOfTerm = reader.GetOrdinal("TERM_CODE");

            while (reader.Read())
            {

                for (int i = 0; i < items.Count; i++)
                {
                    if ((items[i].title.Split(' ')[0] + "-" + items[i].title.Split(' ')[1]).Equals(reader.GetValue(indexOfCourse).ToString()))
                    {
                        items[i].grade = reader.GetValue(indexOfGrade).ToString();
                        items[i].semester = reader.GetValue(indexOfTerm).ToString().Substring(2, 3);
                    }

                }

            }
        }

        myConnection.Close();

        //   items.Sort((a, b) => (a.semester.CompareTo(b.semester)));

        List<List<Item>> courses = new List<List<Item>>();

        for (int i = 0; i < items.Count; i++)
        {
            if (searchForSemester(items[i], courses))
            {
                int index = findSemesterList(items[i], courses);
                courses[index].Add(items[i]);
            }

            else
            {
                List<Item> temp = new List<Item>();
                temp.Add(items[i]);
                courses.Add(temp);
            }
        }

        for (int i = 0; i < courses.Count; i++)
        {
            for (int j = 0; j < courses[i].Count; j++)
            {
                Debug.WriteLine(courses[i][j].title + " " + courses[i][j].semester);
            }

            Debug.WriteLine("New Line");

        }

        Debug.WriteLine("لا تعاند من إذا قال فعل");
        return courses;
    }

    [WebMethod]
    public static bool searchForSemester(Item i, List<List<Item>> list)
    {
        if (list != null)
        {
            for (int j = 0; j < list.Count; j++)
            {
                if (list[j] != null && list[j][0] != null && list[j][0].semester != null && i.semester != null)
                {
                    if (i.semester.Equals(list[j][0].semester))
                        return true;
                }
            }
        }

        return false;
    }

    [WebMethod]
    public static int findSemesterList(Item i, List<List<Item>> list)
    {
        int index = -1;

        if (list != null)
        {
            for (index = 0; index < list.Count; index++)
            {
                if (list[index] != null && list[index][0] != null && list[index][0].semester != null && i.semester != null)
                {
                    if (i.semester.Equals(list[index][0].semester))
                        return index;
                }
            }

        }

        return index;
    }

    [WebMethod]
    public static List<Item> filter(List<Item> items)
    {
        List<Item> courses = items;

        for (int i = 0; i < courses.Count; i++)
        {
            Item temp = courses[i];
            for (int j = 0; j < courses.Count; j++)
            {
                if (temp.title.Equals(courses[j].title))
                {
                    courses.Remove(temp);
                    courses[j].semester += "\n" + temp.semester;
                }
            }
        }

        return courses;
    }

    [WebMethod]
    public static bool saveCourses(user u, List<Item> items)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "INSERT INTO NAJAAH_APPROVAL_REQUEST (STU_ID, FAC_ID, APPROVED) VALUES ('"+u.id+"', '"+u.advisor_ID+"', '0')";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();
        myConnection.Close();

        for (int i = 0; i < items.Count; i++)
        {
            myConnection.Open();
            query = "INSERT INTO NAJAAH_APPROVAL_COURSES (STU_ID, FAC_ID, CRSE_TITLE, CRSE_CREDIT, CRSE_SEMESTER) VALUES ('" + u.id + "', '" + u.advisor_ID + "', '" + items[i].title + "', '" + items[i].credit + "', '" + items[i].semCode + "')";
            cmd = new SqlCommand(query, myConnection);

            reader = cmd.ExecuteReader();
            myConnection.Close();
        }
        return true;
    }

    [WebMethod]
    public static List<user> getRequested(user u)
    {

        List<user> users = new List<user>();
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT STU_ID FROM NAJAAH_APPROVAL_REQUEST WHERE FAC_ID = '"+u.id+"' AND APPROVED = '0'";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            var indexOfID = reader.GetOrdinal("STU_ID");
            
            while (reader.Read())
            {
                var ID = reader.GetValue(indexOfID).ToString();
                var Name = getName(ID);

                while (reader.Read())
                {
                    users.Add(new user()
                    {

                        id = ID,
                        name = Name,

                    });
                }
            }
        }
        myConnection.Close();

        return users;
    }

    [WebMethod]
    public static List<user> getApproved(user u)
    {

        List<user> users = new List<user>();
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT STU_ID FROM NAJAAH_APPROVAL_REQUEST WHERE FAC_ID = '" + u.id + "' AND APPROVED = '1'";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            var indexOfID = reader.GetOrdinal("STU_ID");

            while (reader.Read())
            {
                var ID = reader.GetValue(indexOfID).ToString();
                var Name = getName(ID);

                while (reader.Read())
                {
                    users.Add(new user()
                    {

                        id = ID,
                        name = Name,

                    });
                }
            }
        }
        myConnection.Close();

        return users;
    }

    [WebMethod]
    public static string getName(string id)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string name = "";

        string query = "SELECT STU_FIRST_NAME, STU_LAST_NAME FROM VIEW STUDENT WHERE STU_ID = '" + id +"'";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            var indexOfFirstName = reader.GetOrdinal("STU_FIRST_NAME");
            var indexOfLastName = reader.GetOrdinal("STU_LAST_NAME");

            while (reader.Read())
            {
                name = reader.GetValue(indexOfFirstName).ToString();
                name += " " + reader.GetValue(indexOfLastName).ToString();
            }
        }

        myConnection.Close();

        return name;

    }

    [WebMethod]
    public static List<Item> getNextCourses(user u)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        List<Item> courses = new List<Item>();

        string query = "SELECT CRSE_TITLE, CRSE_CREDIT, CRSE_SEMESTER FROM NAJAAH_APPROVAL_COURSES WHERE STU_ID = '"+u.id+"' AND CRSE_SEMSTER > '0'";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            var indexOfTitle = reader.GetOrdinal("CRSE_TITLE");
            var indexOfCredit = reader.GetOrdinal("CRSE_CREDIT");
            var indexOfSemester = reader.GetOrdinal("CRSE_SEMESTER");

            while (reader.Read())
            {

                var Title = reader.GetValue(indexOfTitle).ToString();
                var Credit = reader.GetValue(indexOfCredit).ToString();
                var SemCode = reader.GetValue(indexOfSemester).ToString();

                courses.Add(new Item()
                {
                    title = Title,
                    credit = Credit,
                    semCode = Int32.Parse(SemCode),

                });
            }
        }
        myConnection.Close();

        return courses;
    }

    [WebMethod]
    public static bool approvePlan(user u, List<Item> items)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "UPDATE NAJAAH_APPROVAL_REQUEST SET APPROVED = '1' WHERE STU_ID = '" + u.id + "' AND FAC_ID = '" + u.advisor_ID + "'";
        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();
        myConnection.Close();

        for (int i = 0; i < items.Count; i++)
        {
            myConnection.Open();
            query = "UPDATE NAJAAH_APPROVAL_COURSES SET CRSE_SEMESTER = '0' WHERE STU_ID = '" + u.id + "' AND FAC_ID = '" + u.advisor_ID + "' AND CRSE_TITLE = '"+items[i].title+"'";
            cmd = new SqlCommand(query, myConnection);

            reader = cmd.ExecuteReader();
            myConnection.Close();
        }
        return true;
    }

}