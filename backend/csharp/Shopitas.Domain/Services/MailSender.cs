namespace Shopitas.Domain.Services
{
    public interface MailSender
    {
        void Send(string mail, string message);
    }
}