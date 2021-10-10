JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = ENV['ENCRYPTION_KEY'] || 'secret'
JWTSessions.access_exp_time = 3600
