namespace Entities
{
    public class Log
    {
        public int LogId { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Period { get; set; }
        public string Actions { get; set; }
        public string OtherInfo { get; set; }

        public Log(int logId, int userId, string userName, string period, string actions, string otherInfo)
        {
            LogId = logId;
            UserId = userId;
            UserName = userName;
            Period = period;
            Actions = actions;
            OtherInfo = otherInfo;
        }
    }
}