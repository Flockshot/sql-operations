SELECT member_id, name, surname, tel
FROM Member;


SELECT group_name, creation_date
FROM GroupInfo 
WHERE created_by=1333
AND group_type='Unlisted';


SELECT name, surname, email
FROM Member, GroupInfo 
WHERE created_by=member_id
AND group_type='Standard'
AND creation_date>TO_DATE('01-01-2022','DD-MM-YYYY');


SELECT p.title, p.content
FROM post p, (SELECT connection_member_id
    FROM ConnectionList
    WHERE member_id=(SELECT member_id
        FROM member
        WHERE name='Yeliz' AND surname='Yesilada')
        ) c
WHERE c.connection_member_id=p.posted_by;


SELECT m.name, m.surname, group_name, manager.name, manager.surname
FROM Member m, GroupInfo g, Company c, Member manager
WHERE companyname='Curiosity'
AND c.company_id=m.company_id
AND created_by=m.member_id
AND manager_id=manager.member_id;


SELECT m.name, m.surname, t.attempts
FROM member m, (SELECT  at.member_id, count(at.member_id) as attempts
    FROM AssessmentTaken at, (SELECT assessment_id
        FROM Assessment
        WHERE name='Introduction to Phyton') a
        WHERE at.assessment_id=a.assessment_id
        group by at.member_id) t
        where t.member_id=m.member_id;

