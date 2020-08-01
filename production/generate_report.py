
# issues = [("activity", "details", "code", "cvss")]

row_template = open("issue_row.html").read()
template = open("report_template.html").read()

def gen_report(app_name, issues):
    iss_lines = []
    for activity, details, code, cvss in issues:
        cvss_rate = cvss.split(" (")[0]
        cvss_level = cvss.split(" (")[1].split(")")[0]
        row = row_template.replace("[ACTIVITY]", activity)\
                          .replace("[DETAILS]", details)\
                          .replace("[CODE]", code)\
                          .replace("[CVSS]", cvss_rate)\
                          .replace("[LEVEL]", cvss_level)                            
        iss_lines.append(row)
    iss = "\n".join(iss_lines)
    html = template.replace("[APPNAME]", app_name).replace("[ISSUES]", iss)
    open("report_{}.html".format(app_name), "w").write(html)
