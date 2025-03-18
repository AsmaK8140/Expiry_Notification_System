CREATE OR REPLACE NOTIFICATION INTEGRATION my_email_int
  TYPE=EMAIL
  ENABLED=TRUE
  DEFAULT_RECIPIENTS = ('user@gmail.com')
  DEFAULT_SUBJECT = 'Service status'
  COMMENT = 'Subscription Expiry Email Notification';
 
DESC NOTIFICATION INTEGRATION email_notification_int;
 
GRANT USAGE ON INTEGRATION my_email_int TO ROLE ACCOUNTADMIN;
 
CALL SYSTEM$SEND_SNOWFLAKE_NOTIFICATION(
  '{
    "text/html": "<p>Hello <b>{user_name}</b>, Your subscription will expire on <b>{Exipiry_date}</b>.</p><div style=\\"border:1px solid blue;display:flex;width:100%;padding:10px 0px;box-sizing:border-box;align-items:center;justify-content:center;gap:20px;\\"><a href=\\"https://your-approval-url?status=reject&customer={CUSTOMER_ID}\\" target=\\"_blank\\" style=\\"background:red;font-size:14px;font-weight:500;color:#FFFFFF;border:0;border-radius:8px;padding:8px 30px;text-decoration:none;cursor:pointer;display:inline-block;margin-right:20px;\\">Reject</a><a href=\\"https://your-approval-url?status=approve&customer={CUSTOMER_ID}\\" target=\\"_blank\\" style=\\"background:green;font-size:14px;font-weight:500;color:#FFFFFF;border:0;border-radius:8px;padding:8px 30px;text-decoration:none;cursor:pointer;display:inline-block;\\">Approve</a></div><br><p>Thank You!</p>"
  }',
  '{
    "my_email_int": {
      "subject": "Subscription Expiry Notification",
      "toAddress": ["user@gmail.com"]
    }
  }'
);
 
 
CALL SYSTEM$SEND_SNOWFLAKE_NOTIFICATION(
   '{
    "text/html": "<p>Hello <b>{user_name}</b>, Your subscription will expire on <b>{Expiry_date}</b>.</p><div style=\\"border:1px solid blue;display:flex;width:100%;padding:10px 0px;box-sizing:border-box;align-items:center;justify-content:center;gap:20px;\\"><a href=\\"https://your-approval-url?status=reject&customer={CUSTOMER_ID}\\" target=\\"_blank\\" style=\\"background:red;font-size:14px;font-weight:500;color:#FFFFFF;border:0;border-radius:8px;padding:8px 30px;text-decoration:none;cursor:pointer;display:inline-block;margin-right:20px;\\">Reject</a><a href=\\"https://your-approval-url?status=approve&customer={CUSTOMER_ID}\\" target=\\"_blank\\" style=\\"background:green;font-size:14px;font-weight:500;color:#FFFFFF;border:0;border-radius:8px;padding:8px 30px;text-decoration:none;cursor:pointer;display:inline-block;\\">Approve</a></div><br><p>Thank You!</p>"
  }',
  '{ "my_email_int": {} }'
);
 
 
 
SHOW INTEGRATIONS;
 
ALTER NOTIFICATION INTEGRATION my_email_int
SET ALLOWED_RECIPIENTS = ('user@gmail.com');
 
SHOW USERS;
