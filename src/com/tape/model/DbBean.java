package com.tape.model;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import javax.naming.*;
import javax.sql.DataSource;

public class DbBean {
    private DataSource dataSource;

    public DbBean() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/chatroom");
        } catch (NamingException ex) {
            Logger.getLogger(DbBean.class.getName())
                    .log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex);
        }
    }
      //以下是插入user表
    public void insertUser(User user) {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = dataSource.getConnection();
            statement = conn.prepareStatement("INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
            statement.setInt(1, user.getUserNumber());
            statement.setString(2, user.getUserName());
            statement.setString(3, user.getPhoto());
            statement.setInt(4, user.getGender());
            statement.setString(5, user.getUserPwd());
            statement.setString(6, user.getQuestiona());
            statement.setString(7, user.getProtectQuestiona());
            statement.setString(8, user.getQuestionb());
            statement.setString(9, user.getProtectQuestionb());
            statement.setString(10, user.getQuestionc());
            statement.setString(11, user.getProtectQuestionc());
            statement.setString(12, user.getEmail());
            statement.setInt(13, user.getMclass());
            int i=statement.executeUpdate();
            user.setNuma(i);
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
    }
    
  //以下是更新user表
    public void updateUser(User user) {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = dataSource.getConnection();
            statement = conn.prepareStatement("UPDATE user SET UserName=?,Photo=?,sex=?,Password=?,Questiona=?,ProtectQuestiona=?,Questionb=?,ProtectQuestionb=?,Questionc=?,ProtectQuestionc=?,Email=?,Class=? WHERE UserNumber=?");
            
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPhoto());
            statement.setInt(3, user.getGender());
            statement.setString(4, user.getUserPwd());
            statement.setString(5, user.getQuestiona());
            statement.setString(6, user.getProtectQuestiona());
            statement.setString(7, user.getQuestionb());
            statement.setString(8, user.getProtectQuestionb());
            statement.setString(9, user.getQuestionc());
            statement.setString(10, user.getProtectQuestionc());
            statement.setString(11, user.getEmail());
            statement.setInt(12, user.getMclass());
            statement.setInt(13, user.getUserNumber());
            
            int i=statement.executeUpdate();
            user.setNuma(i);
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
    }
    
    //以下是从user表删除用户
    public void deleteUser(User user) {
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = dataSource.getConnection();
            statement = conn.prepareStatement("DELETE FROM user WHERE UserNumber=?");
            statement.setInt(1, user.getUserNumber());
            
            int i=statement.executeUpdate();
            user.setNuma(i);
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
    }
    
        //以下是插入chatrecord表
    public void insertChatRecord(User user) {
    	Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = dataSource.getConnection();
            statement = conn.prepareStatement("INSERT INTO chatrecord VALUES (?,?,?)");
            statement.setInt(1, user.getUserNumber());
            statement.setString(2, user.getChatDate());
            statement.setString(3, user.getChatRecord());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
    }    
    
    //以下是插入personalchat表
    public void insertPersonalChat(User user) {
    	Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = dataSource.getConnection();
            statement = conn.prepareStatement("INSERT INTO personalchat VALUES (?,?,?)");
            statement.setString(1, user.getTwoUserNumber());
            statement.setString(2, user.getChatDate());
            statement.setString(3, user.getChatRecord());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
    }
    
    //以下是根据UserNumber查询user表的该行数据
    public List<User> getUsers(Integer userNumer) {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
        List<User> users = new ArrayList<User>();
        try {
            conn = dataSource.getConnection();
            statement = conn.createStatement();
            result = statement.executeQuery("SELECT * FROM user WHERE UserNumber='"+userNumer+"'");//SELECT * FROM user
            //users = new ArrayList<User>();
            while (result.next()) {
                User user = new User();
                user.setUserNumber(result.getInt(1));
                user.setUserName(result.getString(2));
                user.setPhoto(result.getString(3));
                user.setGender(result.getInt(4));
                user.setUserPwd(result.getString(5));
                user.setQuestiona(result.getString(6));
                user.setProtectQuestiona(result.getString(7));
                user.setQuestionb(result.getString(8));
                user.setProtectQuestionb(result.getString(9));
                user.setQuestionc(result.getString(10));
                user.setProtectQuestionc(result.getString(11));
                user.setEmail(result.getString(12)); 
                user.setMclass(result.getInt(13)); 
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
        return users;
    }
    
     //以下是查询user表的全部UserNumber/UserName/Photo数据
    public List<User> getUserall() {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
        List<User> users = new ArrayList<User>();
        try {
            conn = dataSource.getConnection();
            statement = conn.createStatement();
            result = statement.executeQuery("SELECT UserNumber,UserName,Photo FROM user");            
            while (result.next()) {
                User user = new User();
                user.setUserNumber(result.getInt(1));
                user.setUserName(result.getString(2));
                user.setPhoto(result.getString(3));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
        return users;
    }
    
    //以下是查询chatrecord表的一个日期的数据
    public List<User> getChatRecords(String day) {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
        List<User> chatRecords = null;
        try {
            conn = dataSource.getConnection();
            statement = conn.createStatement();
            result = statement.executeQuery("SELECT * FROM chatrecord WHERE Date LIKE'"+ day +"%'");
            chatRecords = new ArrayList<User>();
            while (result.next()) {
                User chatRecord = new User();
                chatRecord.setUserNumber(result.getInt(1));
                chatRecord.setChatDate(result.getString(2));
                chatRecord.setChatRecord(result.getString(3));
                chatRecords.add(chatRecord);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
        return chatRecords;
    }
    
  //以下是查询personalchat表的数据
    public List<User> getPersonalChatRecords(String twoUserNumber,String day) {
        Connection conn = null;
        Statement statement = null;
        ResultSet result = null;
        List<User> chatRecords = null;
        try {
            conn = dataSource.getConnection();
            statement = conn.createStatement();
            result = statement.executeQuery("SELECT * FROM personalchat WHERE TwoUserNumber='"+ twoUserNumber +"' AND Date LIKE'"+ day +"%'");
            chatRecords = new ArrayList<User>();
            while (result.next()) {
                User chatRecord = new User();
                chatRecord.setTwoUserNumber(result.getString(1));
                chatRecord.setChatDate(result.getString(2));
                chatRecord.setChatRecord(result.getString(3));
                chatRecords.add(chatRecord);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex);
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DbBean.class.getName()).log(Level.SEVERE, null, ex);
                throw new RuntimeException(ex);
            }
        }
        return chatRecords;
    }
    
}
