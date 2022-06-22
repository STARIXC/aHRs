
package models;

/**
 *
 * @author UTJ
 */
public class LeaveBalance {
    String leave_type,number_days,number_consumed,current_balance;

    public String getLeave_type() {
        return leave_type;
    }

    public void setLeave_type(String leave_type) {
        this.leave_type = leave_type;
    }

    public String getNumber_days() {
        return number_days;
    }

    public void setNumber_days(String number_days) {
        this.number_days = number_days;
    }

    public String getNumber_consumed() {
        return number_consumed;
    }

    public void setNumber_consumed(String number_consumed) {
        this.number_consumed = number_consumed;
    }

    public String getCurrent_balance() {
        return current_balance;
    }

    public void setCurrent_balance(String current_balance) {
        this.current_balance = current_balance;
    }

    public LeaveBalance() {
    }
    
}
