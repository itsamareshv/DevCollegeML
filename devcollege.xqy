xquery version "1.0-ml";

declare namespace wl = "http://marklogic.com/mlu/world-students";


xdmp:set-response-content-type("text/html; charset=utf-8"),
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>World Students</title>
        <link href="css/bt.css" rel="stylesheet" type="text/css" />
        <link href="css/d.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand text-light border-secondary" aria-current="page" ><h1>DEV COLLEGE</h1></a>
                <form class="d-flex" role="search">
                    <button class="btn btn-light btn-outline-light"  id="submitbtn" value="go" type="submit"> <a href="searchStudent.xqy" style="text-decoration: none;">Search</a></button>
                </form>
            </div>
        </nav>

        <div id="wrapper" >
            <button type="button " id="count" class="btn btn-dark position-relative">
                Student Count
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    {fn:count(/wl:students/wl:student)}
                    <span class="visually-hidden">unread messages</span>
                </span>
            </button>


            <br />
            <br />
            <br />

            <div id="content">

                <table  class="table">
                    <thead>
                        <tr class="table-dark">
                            <th>Name</th>
                            <th>Age</th>
                            <th>Course</th>
                            <th>Country</th>
                            <th>DOB</th>
                        </tr>
                    </thead>


                    {for $student in /wl:students/wl:student
                    let $name := $student/wl:name/text()
                    let $age := $student/wl:age/text()
                    let $country := $student/wl:country/text()
                    let $course := $student/wl:course/text()
                    let $dob := $student/wl:dob/text()
                    order by $name
                    return (



                        <tr>
                            <td><b>{$name}</b></td>
                            <td><b>{$age}</b></td>
                            <td>{$course}</td>
                            <td>{$country}</td>
                            <td>{$dob}</td>
                        </tr>)
                    }

                </table>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>
