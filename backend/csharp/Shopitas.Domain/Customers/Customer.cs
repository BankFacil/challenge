using System.Collections.Generic;
using Shopitas.Domain.Base;
using Shopitas.Domain.Products;

namespace Shopitas.Domain.Customers
{
    public class Customer : Entity
    {
        public Customer(string mail)
        {
            Mail = mail;
            Memberships = new List<CustomerMembership>();
            Vouchers = new List<Voucher>();
        }

        public string Mail { get; }
        public IList<CustomerMembership> Memberships { get; }

        public IList<Voucher> Vouchers { get; set; }

        public void ActivateMembership(Membership membership)
        {
            var customerMembership = new CustomerMembership(membership, this);
            customerMembership.Activate();
            Memberships.Add(customerMembership);

            DomainEventNotifier.CurrentNotifier.NotifyAbout(new MembershipActivated(this));
        }

        public void GiveAVoucherOf(decimal value)
        {
            Vouchers.Add(new Voucher(value));
        }
    }
}