package com.synergisticit.stripe_payment.controller;

import com.synergisticit.stripe_payment.dto.ProductRequest;
import com.synergisticit.stripe_payment.dto.StripeResponse;
import com.synergisticit.stripe_payment.service.StripeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/product")
public class ProductCheckoutController {

    @Autowired
    private StripeService stripeService;

    @GetMapping("/checkout")
    public String showCheckoutForm( Model model){
        model.addAttribute("productRequest", new ProductRequest());
        return "ProductPage";
    }

    @PostMapping("/checkout")
    public String processCheckout(@ModelAttribute ProductRequest productRequest){

        try {
            StripeResponse stripeResponse = stripeService.checkoutProducts(productRequest);

            return "redirect:" + stripeResponse.getSessionUrl();
        } catch(Exception e){
            System.out.println(e.getMessage());

            return "redirect:/product/checkout";
        }
    }


    @GetMapping("/success")
    public String success(Model model){
        model.addAttribute("message", "You have successfully ordered a hotel room");
        return "success";
    }

    @GetMapping("/cancel")
    public String cancel(Model model){
        model.addAttribute("message", "Your order has been canceled");
        return "cancel";
    }

}
