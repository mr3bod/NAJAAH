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

public partial class Default3 : System.Web.UI.Page
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
            query = "SELECT CRSE_CODE, FINAL_GRADE, TERM_CODE FROM VIEW_TRANSCRIPT WHERE STU_ID = '"+ e.id +"'";
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
                            if (items[i][j].grade == null)
                            {
                                items[i][j].grade = reader.GetValue(indexOfGrade).ToString();
                                items[i][j].semester = reader.GetValue(indexOfTerm).ToString().Substring(2, 3);
                            }
                            else
                            {
                                items[i][j].grade += "\n" + reader.GetValue(indexOfGrade).ToString();
                                items[i][j].semester += "\n" + reader.GetValue(indexOfTerm).ToString().Substring(2, 3);
                            }
                        }
                    }

                }
            }
        }

            myConnection.Close();

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

        query = "SELECT CRSE_CODE, FINAL_GRADE, TERM_CODE FROM VIEW_TRANSCRIPT WHERE STU_ID = '"+ e.id +"'";

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
                        if (items[i].grade == null)
                        {
                            items[i].grade = reader.GetValue(indexOfGrade).ToString();
                            items[i].semester = reader.GetValue(indexOfTerm).ToString().Substring(2, 3);
                        }
                        else
                        {
                            items[i].grade += "\n" +reader.GetValue(indexOfGrade).ToString();
                            items[i].semester += "\n" + reader.GetValue(indexOfTerm).ToString().Substring(2, 3);
                        }
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

        string query = "SELECT TERM_CODE, STU_SECTION_CRN  FROM VIEW_STUDENT_SCHEDULE WHERE STUDENT_ID = '"+ e.id +"'";

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

                else if (list[j] != null && list[j][0] != null && list[j][0].semester == null && i.semester == null)
                {
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
                if (list[index] != null && list[index][0] != null)
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
     //   List<Item> courses2 = items;

        for(int i= 0; i < courses.Count; i++)
        {
           Item temp = courses[i];
            //courses2.Remove(courses[i]);
            for (int j = 0; j < courses.Count; j++)
            {
                if (courses[j].semester != null) {
                    if (temp.title.Equals(courses[j].title) && !(temp.semester.Equals(courses[j].semester)))
                    {
                        courses.Remove(temp);
                        courses[j].semester += "\n" + temp.semester;
                        Debug.WriteLine("dddddddddd");
                    }
                }
            }
        }
        return courses;
    }

    [WebMethod]
    public static List<Item> getElectives(user u)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT CRSE_CODE, FINAL_GRADE, TERM_CODE FROM VIEW_TRANSCRIPT WHERE STU_ID = '" + u.id + "'";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        List<Item> items = new List<Item>();

        if (reader.HasRows)
        {
            var indexOfTitle = reader.GetOrdinal("CRSE_CODE");
            var indexOfGrade = reader.GetOrdinal("FINAL_GGRADE");
            var indexOfSemester = reader.GetOrdinal("TERM_CODE");

            while (reader.Read())
            {
                var Title = reader.GetValue(indexOfTitle).ToString();
                Title = Title.Split('-')[0] + " " + Title.Split('-')[1];
                var Grade = reader.GetValue(indexOfGrade).ToString();
                var Semester = reader.GetValue(indexOfSemester).ToString();

                items.Add(new Item()
                {
                    title = Title,
                    grade = Grade,
                    semester = Semester,
                });
            }
        }

        List<Item> courses = filterElectives(u, items);

        myConnection.Close();

        for (int i = 0; i < courses.Count; i++)
        {
            courses[i].credit = getCredit(courses[i]);
        }

        return courses;
    }

    [WebMethod]
    public static List<Item> filterElectives(user u, List<Item> courses)
    {
        List<Item> all = GetCourses(u);
        List<Item> temp = courses;

        for (int i = 0; i < temp.Count; i++)
        {
            Item item = temp[i];

            for (int j = 0; j < all.Count; j++)
            {
                if (item.title.Equals(all[j].title))
                {
                    temp.Remove(item);
                }
            }
        }

        return temp;
    }

    [WebMethod]
    public static string getCredit(Item i)
    {
        String con = WebConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(con);

        myConnection.Open();

        string query = "SELECT credit FROM NAJAAH_DEGREE_PLAN WHERE CRSE_CODE = '" + i.title.Split(' ')[0]+ "' AND CRSE_NUMB = '"+i.title.Split(' ')[1]+"'";

        SqlCommand cmd = new SqlCommand(query, myConnection);

        SqlDataReader reader = cmd.ExecuteReader();

        string credit = null;

        if (reader.HasRows)
        {
            var indexOfCredit = reader.GetOrdinal("credit");

            while (reader.Read())
            {
                credit = reader.GetValue(indexOfCredit).ToString();
            }
        }

        myConnection.Close();

        return credit;
    }
}