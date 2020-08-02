import os

# issues = [("activity", "details", "code", "cvss")]

row_template = open("issue_row.html").read()
template = open("report_template.html").read()

def gen_report(app_name, issues):
    iss_lines = []
    iss_items = {}
    for activity, details, code, cvss in issues:
        cvss_rate = cvss.split(" (")[0]
        cvss_level = cvss.split(" (")[1].split(")")[0]
        if (activity, details, cvss_rate, cvss_level) not in iss_items:
            iss_items[(activity, details, cvss_rate, cvss_level)] = []
        iss_items[(activity, details, cvss_rate, cvss_level)].append(code)
    
    for(activity, details, cvss_rate, cvss_level), codes in iss_items.items():
        code_lines = "\n".join("\t"*11 + "<code>" + c + "</code>" for c in codes)
        row = row_template.replace("[ACTIVITY]", activity)\
                          .replace("[DETAILS]", details)\
                          .replace("[CODES]", code_lines)\
                          .replace("[CVSS]", cvss_rate)\
                          .replace("[LEVEL]", cvss_level)                         
        iss_lines.append(row)
        
    iss = "\n".join(iss_lines)
    html = template.replace("[APPNAME]", app_name).replace("[ISSUES]", iss)
    open("IAAST_{}.html".format(app_name), "w").write(html)
    print("[*] IAAST: Report generated!")
    print("[*] IAAST: {}".format(os.path.abspath("IAAST_{}.html".format(app_name))))
