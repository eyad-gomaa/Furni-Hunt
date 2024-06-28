class CustomerPaymentModel {
    CustomerPaymentModel({
        required this.id,
        required this.object,
        required this.address,
        required this.balance,
        required this.created,
        required this.currency,
        required this.defaultSource,
        required this.delinquent,
        required this.description,
        required this.discount,
        required this.email,
        required this.invoicePrefix,
        required this.invoiceSettings,
        required this.livemode,
        required this.metadata,
        required this.name,
        required this.nextInvoiceSequence,
        required this.phone,
        required this.preferredLocales,
        required this.shipping,
        required this.taxExempt,
        required this.testClock,
    });

    final String? id;
    final String? object;
    final dynamic address;
    final int? balance;
    final int? created;
    final dynamic currency;
    final dynamic defaultSource;
    final bool? delinquent;
    final dynamic description;
    final dynamic discount;
    final String? email;
    final String? invoicePrefix;
    final InvoiceSettings? invoiceSettings;
    final bool? livemode;
    final Metadata? metadata;
    final String? name;
    final int? nextInvoiceSequence;
    final dynamic phone;
    final List<dynamic> preferredLocales;
    final dynamic shipping;
    final String? taxExempt;
    final dynamic testClock;

    factory CustomerPaymentModel.fromJson(Map<String, dynamic> json){ 
        return CustomerPaymentModel(
            id: json["id"],
            object: json["object"],
            address: json["address"],
            balance: json["balance"],
            created: json["created"],
            currency: json["currency"],
            defaultSource: json["default_source"],
            delinquent: json["delinquent"],
            description: json["description"],
            discount: json["discount"],
            email: json["email"],
            invoicePrefix: json["invoice_prefix"],
            invoiceSettings: json["invoice_settings"] == null ? null : InvoiceSettings.fromJson(json["invoice_settings"]),
            livemode: json["livemode"],
            metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
            name: json["name"],
            nextInvoiceSequence: json["next_invoice_sequence"],
            phone: json["phone"],
            preferredLocales: json["preferred_locales"] == null ? [] : List<dynamic>.from(json["preferred_locales"]!.map((x) => x)),
            shipping: json["shipping"],
            taxExempt: json["tax_exempt"],
            testClock: json["test_clock"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "address": address,
        "balance": balance,
        "created": created,
        "currency": currency,
        "default_source": defaultSource,
        "delinquent": delinquent,
        "description": description,
        "discount": discount,
        "email": email,
        "invoice_prefix": invoicePrefix,
        "invoice_settings": invoiceSettings?.toJson(),
        "livemode": livemode,
        "metadata": metadata?.toJson(),
        "name": name,
        "next_invoice_sequence": nextInvoiceSequence,
        "phone": phone,
        "preferred_locales": preferredLocales.map((x) => x).toList(),
        "shipping": shipping,
        "tax_exempt": taxExempt,
        "test_clock": testClock,
    };

}

class InvoiceSettings {
    InvoiceSettings({
        required this.customFields,
        required this.defaultPaymentMethod,
        required this.footer,
        required this.renderingOptions,
    });

    final dynamic customFields;
    final dynamic defaultPaymentMethod;
    final dynamic footer;
    final dynamic renderingOptions;

    factory InvoiceSettings.fromJson(Map<String, dynamic> json){ 
        return InvoiceSettings(
            customFields: json["custom_fields"],
            defaultPaymentMethod: json["default_payment_method"],
            footer: json["footer"],
            renderingOptions: json["rendering_options"],
        );
    }

    Map<String, dynamic> toJson() => {
        "custom_fields": customFields,
        "default_payment_method": defaultPaymentMethod,
        "footer": footer,
        "rendering_options": renderingOptions,
    };

}

class Metadata {
    Metadata({required this.json});
    final Map<String,dynamic> json;

    factory Metadata.fromJson(Map<String, dynamic> json){ 
        return Metadata(
        json: json
        );
    }

    Map<String, dynamic> toJson() => {
    };

}
